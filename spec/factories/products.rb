FactoryBot.define do

  factory :product do
    id                   {1}
    name                 {"テスト商品名"}
    description          {"テスト説明"}
    brand                {"テストブランド"}
    condition            {"テスト状態"}
    shipping_payer       {"テスト配送料負担"}
    shipping_from_area   {"テスト配送元"}
    shipping_duration    {"テスト配送期間"}
    price                {99999}
    user_id              {1}
    category_id          {1}
  end

end