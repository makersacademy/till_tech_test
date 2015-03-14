Given(/^I am on the homepage$/) do
  visit('/')
  click_button("Clear Order")
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^I should see "(.*?)" x "(.*?)"$/) do |arg1, arg2|
 	expect(page).to have_content("#{arg1} x #{arg2}")
end

When(/^I click on "(.*?)" twice$/) do |arg1|
  click_button(arg1)
  click_button(arg1)
end

Then(/^I should not see "(.*?)" x "(.*?)"$/) do |arg1, arg2|
  expect(page).not_to have_content("#{arg1} x #{arg2}")
end

Then(/^I should see an input field$/) do
  expect(page).to have_selector('input')
end

Then(/^I should see Total = "(.*?)"$/) do |arg1|
  expect(page).to have_content("Total = #{arg1}")
end

Then(/^I should see No items, reset order$/) do
  expect(page).to have_content("No order")
end

Then(/^I should not be able to see "(.*?)"$/) do |arg1|
  expect(page).not_to have_content("Confirm order")
end
