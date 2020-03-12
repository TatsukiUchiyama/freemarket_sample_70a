FactoryBot.define do

  factory :transaction do
    id                    {1}
    product_id            {1}
    card_id               {1}
    user_id               {1}
    status                {0}
  end

end