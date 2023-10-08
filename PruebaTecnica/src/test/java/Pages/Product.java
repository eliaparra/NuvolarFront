package Pages;


import Utilities.BaseClass;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.List;

public class Product extends BaseClass {

    int quantity;


    @FindBy(xpath = "//div[@id='selectQuantity']//span[@class='a-dropdown-container']")
    public WebElement quantitySelector;
    @FindBy(xpath = "//input[@id='add-to-cart-button']")
    public WebElement addToCartButton;
    @FindBy(xpath = "//div[@data-cart-type='Retail_Cart']//span[@class='a-size-base a-text-bold']")
    public WebElement priceElement;

    public String quantities = "//li[@class='a-dropdown-item']/a[text()='%s ']";

    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

    public void selectQuantity(int quantity) {
        this.quantity = quantity;
        WebElement selector = wait.until(ExpectedConditions.elementToBeClickable(quantitySelector));
        selector.click();
        WebElement quantityOption = driver.findElement(By.xpath(String.format(quantities, quantity)));
        quantityOption.click();

    }

    public void addToCart() {
        addToCartButton.click();
    }

    public void setPrice() {

        System.out.println("PRECIO: " + priceElement.getText().substring(3, priceElement.getText().length()));
        System.out.println("tamaño LISTA " + price.size());
        addElementToList(priceElement.getText().substring(3, priceElement.getText().length()));
        //price.add(priceElement.getText());
        System.out.println("tamaño LISTA " + price.size());
    }

    public List<String> returnListPrice() {
        return price;
    }

    public String getPrice(int i) {

        System.out.println("VALOR DE I: " + i);
        return price.get(i);
    }

    public int getQuantity() {
        return quantity;
    }


}
