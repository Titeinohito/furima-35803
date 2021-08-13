FactoryBot.define do
  factory :buy_history do
    association :item, :user
  end
end
