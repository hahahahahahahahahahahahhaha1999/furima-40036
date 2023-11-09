FactoryBot.define do
  factory :user do
    nickname { 'suzuki' }
    email { 'test@example' }
    password { '000000' }
    password_confirmation { '000000' }
    last_name { '鈴木' }
    first_name { '太郎' }
    kana_last { 'スズキ' }
    kana_first { 'タロウ' }
    birthday { '2000-01-01' }
  end
end
