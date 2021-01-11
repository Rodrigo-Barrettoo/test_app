require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:user) # ou create(:customer)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it '#full_name - Sobrescrevendo Atributos' do
    customer = create(:customer, name: 'Barretin Kazaper')
    expect(customer.full_name).to start_with('Sr. Barretin Kazaper')
  end

  it 'Herança - Vip' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it 'Herança - Default' do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end

  it 'Attributes For' do
    attrs_vip = attributes_for(:customer_vip)

    customer = Customer.create(attrs_vip)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it { expect{create(:customer)}.to change{Customer.all.size}.by(1) }
end
