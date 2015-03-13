Given(/^I am on the homepage$/) do
  visit('/')
end

Then(/^I should see "(.*?)"$/) do |shopName|
  expect(page).to have_content(shopName)
end

Given(/^I select "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
