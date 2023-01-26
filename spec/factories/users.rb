FactoryBot.define do
    factory :user do
        nickname              {Faker::Name.initials(number: 6)}
        email                 {Faker::Internet.free_email}
        password              { 'a1'+ Faker::Internet.password(min_length: 6)}
        password_confirmation {password}
        first_name            {"佐藤"}
        last_name             {"由香里"}
        first_name_kana       {"サトウ"}
        last_name_kana        {"ユカリ"}
        birthday              {Faker::Date.birthday}
    end
  end   