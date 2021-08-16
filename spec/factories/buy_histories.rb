FactoryBot.define do
  factory :buy_history do
    association :item
    association :user
  end
end
