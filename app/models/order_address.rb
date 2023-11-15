class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number, :token
  

  with_options presence: true do
    validates :user_id, :item_id, :post_code, :prefecture_id, :municipality, :street_address, :phone_number, :token
  end

  with_options numericality: { other_than: 0 } do
    validates :prefecture_id
  end

  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true}
  validates :phone_number, format: {with: /\A\d{10,11}\z/, allow_blank: true}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number, order: order)
  end
end