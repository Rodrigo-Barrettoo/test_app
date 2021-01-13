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

  it 'Attributo Transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masculino Vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Feminino Default' do
    customer = create(:customer_female_default)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Feminino' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    puts @customer.created_at
    puts Time.now

    expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 01, 04, 44))
  end

  it { expect{create(:customer)}.to change{Customer.all.size}.by(1) }
end
