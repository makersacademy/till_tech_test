World(KnowsTheApi)

When(/^I (?:make|have made) a GET request to "(.*?)"$/) do |address|
  get address 
  expect_status 200
end

Given(/^I receive the status "(\d*?)"$/) do |status|
  expect_status status 
end

Then(/^I should receive a JSON with a menu$/) do
  pending "getting weird errors when trying to test for the menu items array"
end

Given(/^I have made a POST request with my order to "(.*?)"$/) do |address|
  put address, { itemname: :spaghetti }
end

Given(/^I have made POST requests for a few orders$/) do
  steps %{
    And I have made a POST request with my order to "api/order/1"
    And I have made a POST request with my order to "api/order/1"
  }
end

Then(/^I should receive a JSON receipt$/) do
  expect_json_keys [:order, :total] 
end

Given(/^I have made a PUT request making a payment$/) do
  make_api_request_with_payment_of_value 20.0
end

Then(/^my receipt JSON should be updated with the payment$/) do
  expect(receipt_json).to have_key :payment 
end

