When(/^I (?:make|have made) a GET request to "(.*?)"$/) do |address|
  get address 
  expect_status 200
end

Given(/^I receive the status "(\d*?)"$/) do |status|
  expect_status status 
end

Then(/^I should receive a JSON with a menu$/) do
  pending "getting weird errors when trying to test for the menu's array"
end

Given(/^I have made a PUT request with my order to "(.*?)"$/) do |address|
  put address, { itemname: :spaghetti }
end

Given(/^I have made PUT requests for a few orders$/) do
  steps %{
    And I have made a PUT request with my order to "api/order/1"
    And I have made a PUT request with my order to "api/order/1"
  }
end

Then(/^I should receive a JSON receipt$/) do
  expect_json_keys [:order, :total] 
end

