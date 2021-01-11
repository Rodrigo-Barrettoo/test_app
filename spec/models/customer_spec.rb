require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Create a Customer' do
    customer = create(:customer)
    expect(customer.name).to eq('Barretin Kazaper')
  end
end
