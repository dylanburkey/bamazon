const mysql = require("mysql");
const inquirer = require("inquirer");
require("console.table");


const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "root",
  database: "bamazon"
});


// Create connection and load data

connection.connect(function (err) {
  if (err) {
    console.error("error connecting: " + err.stack);
  }
  loadProducts();
});



// Load Products
function loadProducts() {
  connection.query("SELECT * FROM products", function (err, res) {
    if (err) throw err;

    console.table(res);

    promptCustomerForItem(res);
  });
}


// Get product id from user

function promptCustomerForItem(inventory) {
  // Prompts user for what they would like to purchase
  inquirer
    .prompt([{
      type: "input",
      name: "choice",
      message: "What is the ID of the item you would you like to purchase? [Quit with Q]",
      validate: function (val) {
        return !isNaN(val) || val.toLowerCase() === "q";
      }
    }])
    .then(function (val) {
      // Check if the user wants to quit the program
      checkIfShouldExit(val.choice);
      var choiceId = parseInt(val.choice);
      var product = checkInventory(choiceId, inventory);

      // If there is a product with the id the user chose, prompt the customer for a desired quantity
      if (product) {
        // Pass the chosen product to promptCustomerForQuantity
        promptCustomerForQuantity(product);
      } else {
        // Otherwise let them know the item is not in the inventory, re-run loadProducts
        console.log("\nThat item is not in the inventory.");
        loadProducts();
      }
    });
}


function promptCustomerForQuantity(product) {
  inquirer
    .prompt([{
      type: "input",
      name: "quantity",
      message: "How many would you like? [Quit with Q]",
      validate: function (val) {
        return val > 0 || val.toLowerCase() === "q";
      }
    }])
    .then(function (val) {
      // Check if the user wants to quit the program
      checkIfShouldExit(val.quantity);
      var quantity = parseInt(val.quantity);

      // If there isn't enough of the chosen product and quantity, let the user know and re-run loadProducts
      if (quantity > product.stock_quantity) {
        console.log("\nInsufficient quantity!");
        loadProducts();
      } else {
        // Otherwise run makePurchase, give it the product information and desired quantity to purchase
        makePurchase(product, quantity);
      }
    });
}



