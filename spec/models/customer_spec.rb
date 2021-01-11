require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  fixtures :all
  
  it 'Create a Customer' do
    customer = customers(:rodrigo)
    expect(customer.name).to eq('Barretin Kazaper')
  end
end
