Given(/^a product named Cafe Latte and costing \$(\d+)\.(\d+) is on the menu$/) do |arg1, arg2|
  menu = Menu.new
  expect(menu.items
end

When(/^I enter this with a quantity of (\d+) on the till$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the order subtotal price \(pre\-VAT\) should be \$(\d+)\.(\d+)$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^the order total price \(inc\. VAT\) should include tax of (\d+)\.(\d+)% \(\$(\d+)\.(\d+)\)$/) do |arg1, arg2, arg3, arg4|
  pending # express the regexp above with the code you wish you had
end

Given(/^I am a VAT registered customer$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I get my reciept$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the receipt should include the time and date$/) do
  pending # express the regexp above with the code you wish you had
end
