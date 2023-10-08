package StepDefinition;


import Utilities.BaseClass;
import io.cucumber.java.*;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class Hooks extends BaseClass {


    private static String PATHDRIVER = "./src/test/resources/";
    private String url = "https://www.amazon.com/";


    @Before(order = 1)
    public void beforeScenario() {
        System.out.println("Start the browser and Clear the cookies");
        System.setProperty("webdriver.chrome.driver", PATHDRIVER + "chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.get(url);
    }

    @After
    public void afterScenario() {
        driver.quit();
    }
}
