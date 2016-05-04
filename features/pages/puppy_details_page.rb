class PuppyDetailsPage
  include PageObject

  button(:adopt, :value => 'Adopt Me!')

  def open_adoption_page
    adopt
  end
end