Till Tech Test
=======================

## Synopsis

The [original](https://github.com/makersacademy/till_tech_test) aim of this project 
was to model a typical till, with tax, discount, and payment features.   

![Receipt](http://s7.postimg.org/lyc5s7mqz/2_AF92_A2_D_B011_47_BA_A3_D1_A38_B6_F19_AF01.png =150)  

## Technologies Used  

- Ruby & Sinatra
- jQuery & Handlebars.js
- Cucumber & Capybara 

## Favourite Code Snippet

![Code Snippet](http://oi58.tinypic.com/hs5agw.jpg)  
I learned from the Cucumber Book that it's possible to define transformations within your step definitions
that matching capture groups will get passed to.

## Still to complete/refactor

- Values for menu are presently hardcoded. An integration with a database is needed.

## Takeaway

I learned that step definitions should depend on abstract interfaces to interact with
the system under test, rather than have those interactions coded inline. This is important because
it makes step definitions much less brittle.

