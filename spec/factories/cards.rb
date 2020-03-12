FactoryBot.define do

  factory :card do
    id             {1}
    customer_id    {"cus_123abc"}
    card_id        {"card_123abc"}
    user_id        {1}
  end

end