When(/^I (?:make|have made) a GET request to "(.*?)"$/) do |address|
  get address 
end

Given(/^I receive the status "(\d*?)"$/) do |status|
  expect_status status 
end

Then(/^I should receive a JSON with a menu$/) do
  expect_json({spaghetti: {name: 'Spaghetti', price: 5.0 }})
end

