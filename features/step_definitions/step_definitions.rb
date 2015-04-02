Given(/^I am on the homepage$/) do
  visit("/")
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
  expect(page).to have_selector("input")
end

Then(/^I should see Total = "(.*?)"$/) do |arg1|
  expect(page).to have_content("Total = #{arg1}")
end

Then(/^I should see No items, reset order$/) do
  expect(page).to have_content("No order")
end

Then(/^I should not be able to see "(.*?)"$/) do |arg1|
  expect(page).not_to have_content(arg1)
end

When(/^I click on "(.*?)" 3 times$/) do |arg1|
  click_button(arg1)
  click_button(arg1)
  click_button(arg1)
end

Given(/^I am on order page and I have ordered a Cafe Latte$/) do
  visit("/")
  click_button("Clear Order")
  click_button("Cafe Latte")
  click_button("Confirm Order")
end

When(/^I click "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^I see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I input "(.*?)" cash$/) do |arg1|
  fill_in("cash", with: arg1)
end

Given(/^I am on the order page and I have ordered a "(.*?)" and a "(.*?)"$/) do |arg1, arg2|
  visit("/")
  click_button("Clear Order")
  click_button(arg1)
  click_button(arg2)
  click_button("Confirm Order")
end

When(/^I input some cash$/) do
  fill_in("cash", with: 50)
end

Given(/^I am on the order page and I have ordered 20 Cafe Latte's$/) do
  visit("/")
  click_button("Clear Order")
  20.times { click_button("Cafe Latte") }
  click_button("Confirm Order")
end

When(/^I input sufficient cash$/) do
  fill_in("cash", with: 100)
end

Then(/^I see the current time and date$/) do
  expect(page).to have_content(Time.now.strftime("%d/%m/%Y %H:%M"))
end
