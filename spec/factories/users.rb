FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    email                 {Faker::Internet.free_email}
    first_name            {Gimei.name.first.kanji}
    last_name             {Gimei.name.last.kanji}
    first_name_kana       {Gimei.name.first.katakana}
    last_name_kana        {Gimei.name.last.katakana}
    birthday              {Faker::Date.birthday}
  end
end
