package Pages;


import Utilities.BaseClass;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;


public class Cart extends BaseClass {


    @FindBy(xpath = "//div[@id='nav-cart-text-container']")
    public WebElement cartIcon;

    @FindBy(xpath = "//div[@class='sc-badge-price-to-pay']//span")
    public WebElement priceElement;

    @FindBy(xpath = "//span[@id='sc-subtotal-amount-buybox']/span")
    public WebElement totalPrice;
    @FindBy(xpath = "//span[@class='a-dropdown-prompt']")
    public WebElement quantityElement;

    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

    public String quantitySelector = "//span[@class='a-dropdown-prompt' and text()='%s']/parent::span";


    public String quantities = "//li[contains(@class,'a-dropdown-item')]/a[text()='%s']";

    public void clickCartIcon() {
        cartIcon.click();
    }

    public String getPrice() {
        return priceElement.getText();
    }


    public void selectQuantity(int initialQuantity, int finalQuantity) {
        WebElement selector = driver.findElement(By.xpath(String.format(quantitySelector, initialQuantity)));
        selector.click();
        WebElement quantityOption = driver.findElement(By.xpath(String.format(quantities, finalQuantity)));
        quantityOption.click();
    }

    public float getTotal() {
        driver.navigate().refresh();
        WebElement total = wait.until(ExpectedConditions.visibilityOf(totalPrice));
        return Float.parseFloat(total.getText().substring(3, total.getText().length()));
    }
}
