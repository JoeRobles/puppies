class DetailsPage
  include PageObject

  button(:details, :value => 'View Details')
  p(:notice, :id => 'notice')

  def view_details(puppy_name = nil)
    case puppy_name
      when nil
        details
      else
        xpath_value = "//div[@class='puppy_list']//div[@class='name']/h3[text()='#{puppy_name}']/parent::div/following-sibling::div[@class='view']//input"
        @browser.button(:xpath => xpath_value).when_present(30).click
    end
  end

  def view_notice(expected_message)
    notice.include? expected_message
  end
end