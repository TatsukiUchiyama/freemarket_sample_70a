FactoryBot.define do

  factory :user do
    nickname              {"uchiyama"}
    sequence(:email)      {Faker::Internet.email}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name_kanji     {"内山"}
    first_name_kanji      {"立樹"}
    family_name_kana      {"うちやま"}
    first_name_kana       {"たつき"}
    birthday_year         {"1992"}
    birthday_month        {"09"}
    birthday_day          {"29"}
  end

end