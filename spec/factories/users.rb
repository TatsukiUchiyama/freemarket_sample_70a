FactoryBot.define do

  factory :user do
    id                    {1}
    nickname              {"uchiyama"}
    sequence(:email)      {Faker::Internet.email}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name_kanji     {"内山"}
    first_name_kanji      {"立樹"}
    family_name_kana      {"ウチヤマ"}
    first_name_kana       {"タツキ"}
    year_id               {49}
    month_id              {9}
    day_id                {29}
  end

end