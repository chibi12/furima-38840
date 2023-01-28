class Item < ApplicationRecord
    belongs_to :user
    has_many :purchases
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :item_status
    belongs_to :delivery_change
    belongs_to :sender
    belongs_to :days_to_ship

    validates :name, :price, :comment, presence: true
    with_options numericality: { other_than: 1, message: "can't be blank"}
    varidates :category_id
    varidates :item_status_id
    varidates :delivery_change_id
    varidates :sender_id
    varidates :days_to_ship_id
    end
end
