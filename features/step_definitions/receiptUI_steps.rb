
World(KnowsTheUserInterface)

Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I choose "(.*?)" from the menu$/) do |item_name|
  click_link 'Spaghetti'
end

