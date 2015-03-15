When(/^I (?:make|have made) a GET request to "(.*?)"$/) do |address|
  @json = get "/api/menu/#{address}"
end

Given(/^I receive the status "(\d*?)"$/) do |status|
  expect_status status 
end

Then(/^I should receive a JSON with a menu$/) do
  pending # express the regexp above with the code you wish you had
end

