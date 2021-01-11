require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:user) # ou create(:customer)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it '#full_name' do
    customer = create(:customer, name: 'Barretin Kazaper')
    expect(customer.full_name).to start_with('Sr. Barretin Kazaper')
  end

  it { expect{create(:customer)}.to change{Customer.all.size}.by(1) }
end
