[![Build Status](https://travis-ci.org/andygout/till_tech_test.png)](https://travis-ci.org/andygout/till_tech_test)


Till tech test
==============


Brief
-------

Implement a coffe shop till system that contains the business logic to produce receipts similar to the below sample, based on a `json` price list and test orders.

The receipt must:-

- Calculate and show the correct amount of tax (in this shop's case, 8.64%, which is charged prior to any discounts), as well as correct item totals and total amount.

- Take payment and calculate the correct change.

- Handle discounts: a 5% discount on orders over $50, and a 10% muffin discount.

- Have a user interface that can actually be used as a till.


Sample receipt:
-------

![a receipt](/images/receipt.jpg)


Sample order:
-------

> **Jane**
> 2 x Cafe Latte
> 1 x Blueberry Muffin
> 1 x Choc Mudcake
>
> **John**
> 4 x Americano
> 2 x Tiramisu
> 5 x Blueberry Muffin


User stories:
-------

```
As a coffee shop vendor
I want to be able to tally up the order of a customer
So that I can charge them the correct amount

As a coffee shop customer
I want to be able to review my order
So that I can be assured I have been charged the correct amount

As a pedant
I want to see the amount and total value for each ordered item
So that I can understand how the total amount is comprised

As a skinflint
I want to see the discount (if any) received on my order
So that I can relish the savings

As a bargain lover
I want to be able to view details of offers
So that I can be aware of them for future visits

As a customer with an awareness and interest in the economy
I want to see the tax amount of my order on my receipt
So that I can appreciate how much is feeding back in to the budget

As someone who likes to change their mind
I want to be able to remove items from the order before it is final
So that I purchase the items I absolutely want

As someone who doesn't trust tradespeople
I want the receipt to display the cash given and change due
So that I can ensure it tallies up with what I've been given

As a freelancer
I want the receipt to display the date and time of the purchase
So that I can claim it on my tax return

As a forgetful type
I want the receipt to display the shop's name and address
So that I can revisit in the future
```


Technologies Used:
-------

- Javascript (language) with jQuery (Javascript library).
- Tested using Jasmine (behavior-driven development framework for testing JavaScript code).


Setup:
-------

- Simple HTTP server using Connect and ServeStatic: `npm install connect serve-static`
- Create server.js file as included.
- Run with Node.js: `node server.js`
- Visit `http://localhost:8080/till.html`
- Run Jasmine tests on server `http://localhost:8080/SpecRunner.html`


Process / Obstacles:
-------

- Jasmine tests currently use local JSON object in SpecHelper.js. Possible to make AJAX call to JSON object contained in hipstercoffe.json using below method in test files, but will *not* pass Travis CI (giving following error: `Error: Timeout - Async callback was not invoked within timeout specified by jasmine. DEFAULT_TIMEOUT_INTERVAL. (1)`).

Advice for next steps:
> That means the done (or end) function is not being called in, I think, 2000ms, which seems to imply the AJAX request is failing on Travis for some reason. jQuery’s deferred object also has a fail method (as well as a done), [example](https://api.jquery.com/deferred.fail/). You could use that to console.log the error, and see why it’s failing on Travis. Ultimately though, you don’t want to make any actual AJAX requests at all, so should mock them out. [Sinon](http://sinonjs.org/docs/#server_example) is good at that.

```
beforeEach(function(done) {
  till = new Till();
  order = new Order;
  till.loadDetails()
  .done(function() {
    done();
  });
});

```

- AppSpec.js (runs tests for UI): Buttons are not being created on page load and therefore test cannot identify element to click. Console in SpecRunner.html window reads: `Synchronous XMLHttpRequest on the main thread is deprecated because of its detrimental effects to the end user's experience. For more help, check http://xhr.spec.whatwg.org/.`. Possible further solution [here](http://jasmine.github.io/2.0/introduction.html#section-Asynchronous_Support).


Process:
-------

- Further unit tests for Till: `produceOrderTotal()` and `calculateMuffinDiscount()` (mock `order` to test functions).
- App.js: write `generateReceipt()` method, calling other appropriate functions so that both discounts are applied automatically when generating receipt.


Links:
-------

[Github - Makers Academy: Till Tech Test](https://github.com/makersacademy/till_tech_test)

[Connect](https://www.npmjs.com/package/connect)

[Serve Static](https://github.com/expressjs/serve-static)


Screenshots:
-------

![till_screenshot](/images/till_screenshot.png)


Images:
-------

![a till](/images/till.jpg)