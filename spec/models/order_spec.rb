require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Pedido' do
    order = create(:order)
    puts order.description
    puts order.customer
    puts order.customer.name
    expect(order.customer).to be_kind_of(Customer)
  end

  it '3 Pedidos juntos' do
    orders = create_list(:order, 3)
    puts orders.inspect
    expect(orders.count).to eq(3)
  end
end
