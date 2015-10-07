Till Tech Test
=======================

![TRAVIS_BADGE](https://travis-ci.org/makersacademy/till_tech_test.svg?branch=master)

## Synopsis

Original repo: (https://github.com/makersacademy/till_tech_test)

This is my submission for the Till Tech Test. This is a website simulating a till at a hipster coffee store. The user can enter items from the menu, display the running total, take payment and display receipts. It can also calculate discounts for muffins and large orders.

I originally created the backend logic in Ruby without much trouble. However, once it came to creating an interesting webpage and frontend, I found it tricky to decide what technology to use. In the end I decided on Rails as the framework, with Javascript and jQuery on the frontend.

The Javascript duplicates the majority of the Ruby backend, and in the end the original Ruby scripts are only properly used for the receipt. If I were to start the project again, I would do it entirely in Javascript to save unnecessary work, and most likely use the Express framework, which would be more suitable than Rails.

A database is also used to persist items ordered, so they can be displayed on the /till/new page for the receipt. This could potentially be extended to hold many different orders.

If the coffeeshop decided to sell more items, those items only need to be added to the hipstercoffee.json file, and it will automatically be added throughout the program.

## Technologies Used

- Ruby
- Javascript, jQuery
- Rails, Active Record
- Rspec and Capybara

## Collaborators

- Daryl (http://www.github.com/dwatson62)
