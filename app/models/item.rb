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

    validates :name, :price, presence: true
    with_options numericality: { other_than: 1, message: "can't be blank"}do
    validates :category_id
    validates :item_status_id
    validates :delivery_change_id
    validates :sender_id
    validates :days_to_ship_id
    end
    validates :comment, presence: true, unless: :was_attached?

    def was_attached?
      self.image.attached?
    end
end
