FactoryBot.define do
  factory :user do
    nickname { 'suzuki' }
    email {Faker::Internet.email}
    password { '000aaa' }
    password_confirmation { '000aaa' }
    last_name { '鈴木' }
    first_name { '太郎' }
    kana_last { 'スズキ' }
    kana_first { 'タロウ' }
    birthday { '2000-01-01' }
  end
end
