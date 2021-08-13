FactoryBot.define do
  factory :order_buy_history do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {(Faker::Number.within(range: 100..999))-(Faker::Number.within(range: 1000..9999))}
    area_id {Faker::Number.within(range: 2..48)}
    municipality {Faker::Address.city}
    house_number {Faker::Address.street_address}
    building_name {Faker::Address.street_name}
    phone_number {Faker::Number.within(number:10)}
    association :user, :item 
  end
end
