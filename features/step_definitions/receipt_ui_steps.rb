Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I choose "(.*?)" from the menu$/) do |choice|
  click_link choice 
end
