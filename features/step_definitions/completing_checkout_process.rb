Given(/^I am on the puppy adoption site$/) do
  visit(PuppyAdoptionPage)
end

When(/^I attempt to checkout without (?:a|an) "([^"]*)"$/) do |field|
  go_to_checkout(field)
end

Then(/^I should see the error message "([^"]*)"$/) do |expected_message|
  on(CheckoutPage).display_error(expected_message)
end

When(/^I complete the adoption of a puppy$/) do
  go_to_checkout
end


Then(/^I should see the text "([^"]*)"$/) do |expected_message|
  on(DetailsPage).view_notice(expected_message)
end

When(/^I navigate to the checkout page$/) do
  on(DetailsPage).view_details
  on(PuppyDetailsPage).open_adoption_page
  on(PuppyItemsPage).complete_adoption
end

Then(/^I should see the following payment options:$/) do |table|
  payment_options = table.raw
  payment_options.each do |payment_option|
    on(CheckoutPage).is_payment_option(payment_option[0])
  end
end

def go_to_checkout(field = nil)
  on(DetailsPage).view_details
  on(PuppyDetailsPage).open_adoption_page
  on(PuppyItemsPage).complete_adoption
  if field
    on(CheckoutPage).fill_form(field => '')
  else
    on(CheckoutPage).fill_form
  end
  on(CheckoutPage).checkout
end