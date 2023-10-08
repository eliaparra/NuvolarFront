package Pages;


import Utilities.BaseClass;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;


public class Home extends BaseClass {


    @FindBy(xpath = "//input[@id='twotabsearchtextbox']")
    public WebElement searchInput;

    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));


    public void search(String textToSearch) {
        WebElement search;
        search = wait.until(ExpectedConditions.elementToBeClickable(searchInput));

        search.sendKeys(textToSearch);
        search.sendKeys(Keys.ENTER);
    }
}
