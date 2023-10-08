package StepDefinition;

import Pages.*;
import Utilities.BaseClass;
import io.cucumber.java.en.*;
import org.testng.Assert;


public class MyStepdefs extends BaseClass {


    Home home = new Home();
    Product product = new Product();
    ;
    SearchResults searchResults;
    Cart cart;


    @Given("^Open the Firefox and launch the application$")
    public void openTheFirefoxAndLaunchTheApplication() throws InterruptedException {
        Home home = new Home();


    }


    @When("Search for {string}")
    public void searchFor(String textToSearch) {
        home.search(textToSearch);
    }

    @And("Add first hat to Cart with quantity {int}")
    public void addFirstHatToCartWithQuantity(int quantity) {
        searchResults = new SearchResults();


        searchResults.selectFirstItem();

        product.selectQuantity(quantity);

        product.addToCart();
        product.setPrice();


    }

    @And("Open cart and assert total price and quantity are correct")
    public void openCartAndAssertTotalPriceAndQuantityAreCorrect() {
        cart = new Cart();
        cart.clickCartIcon();


        Assert.assertEquals(this.product.getPrice(1), cart.getPrice().substring(3, cart.getPrice().length()));


    }


    @And("Change the quantity for item selected at step three from {int} to {int} item in Cart")
    public void changeTheQuantityForItemSelectedAtStepThreeFromToItemInCart(int initialQuantity, int finalQuantity) {
        cart.selectQuantity(initialQuantity, finalQuantity);
    }

    @Then("Assert total price and quantiy are changed correctly")
    public void assertTotalPriceAndQuantiyAreChangedCorrectly() {

        System.out.println(product.returnListPrice().size());
        System.out.println(Float.parseFloat(product.returnListPrice().get(1)));
        System.out.println(Float.parseFloat(product.returnListPrice().get(0)));
        System.out.println(cart.getTotal());
        Assert.assertTrue(Float.parseFloat(product.returnListPrice().get(0)) + Float.parseFloat(product.returnListPrice().get(1)) == cart.getTotal());

    }

    @And("Open cart and assert total price and quantity are correct first product")
    public void openCartAndAssertTotalPriceAndQuantityAreCorrectFirstProduct() {
        cart = new Cart();
        cart.clickCartIcon();


        Assert.assertEquals(this.product.getPrice(0), cart.getPrice().substring(3, cart.getPrice().length()));


    }
}
