FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n}" }
    customer
  end
end
