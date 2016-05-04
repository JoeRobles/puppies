class CheckoutPage
  include PageObject

  text_field(:name, :id => 'order_name')
  text_area(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay, :id => 'order_pay_type')

  button(:order, :value => 'Place Order')
  div(:errors, :id => 'error_explanation')

  DEFAULT_DATA = {
      'name' => 'Joe',
      'address' => 'My address',
      'email' => 'a@b.co',
      'pay' => 'Check'
  }

  def fill_form(data = {})
    data = DEFAULT_DATA.merge(data)
    self.name = data['name']
    self.address = data['address']
    self.email = data['email']
    self.pay = data['pay']
  end

  def checkout
    order
  end

  def loaded?
    begin
      Watir::wait.until(5) { name_element.exists? }
      true
    rescue error
      false
    end
  end

  def display_error(expected_message)
    errors.include? expected_message
  end

  def is_payment_option(payment_option)
    pay.include? payment_option
  end
end