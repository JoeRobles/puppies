When(/^I navigate to "([^"]*)"$/) do |web_url|
    @browser.goto web_url
end

And(/^I click the button "([^"]*)"$/) do |button_label|
    @browser.button(:value => button_label).when_present(30).click
end

And(/^I fill the adoption form$/) do
    @browser.text_field(:id => 'order_name').set('Willy')
    @browser.textarea(:id => 'order_address').set('3591 Avenida Republica de Panamá')
    @browser.text_field(:id => 'order_email').set('random@email.com')
    @browser.select_list(:id => 'order_pay_type').select('Check')
end

Then(/^I should see "([^"]*)"$/) do |expected_message|
    @browser.text.should include expected_message
end