FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.word[1..40] }
    descriptin      { Faker::Lorem.sentence[1..1000] }
    category_id      { Faker::Number.within(range: 2..11) }
    condition_id    { Faker::Number.within(range: 2..7) }
    charge_id      { Faker::Number.within(range: 2..3) }
    area_id         { Faker::Number.within(range: 2..48) }
    ship_day_id     { Faker::Number.within(range: 2..4) }
    price           { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
