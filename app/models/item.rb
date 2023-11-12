class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_time

  with_options presence: true do
    validates :image, :item_name, :item_description, :category_id, :item_condition_id, :postage_id, :prefecture_id,
              :shipping_time_id, :price
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000, allow_blank: true }

  with_options numericality: { other_than: 0 } do
    validates :category_id, :item_condition_id, :postage_id, :prefecture_id, :shipping_time_id
  end
end
