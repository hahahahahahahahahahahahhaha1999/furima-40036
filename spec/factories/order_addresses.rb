FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08011111111' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
