class PuppyItemsPage
  include PageObject

  button(:complete, :value => 'Complete the Adoption')

  def complete_adoption
    complete
  end
end