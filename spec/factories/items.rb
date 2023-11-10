FactoryBot.define do
  factory :item do
    item_name             { 'ああああ' }
    item_description      { 'ああああああああ' }
    category_id           { 1 }
    item_condition_id     { 1 }
    postage_id            { 1 }
    prefecture_id         { 1 }
    shipping_time_id      { 1 }
    price                 { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
