class Item < ApplicationRecord
    belongs_to :user
    #has_many :purchases
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :item_status
    belongs_to :delivery_change
    belongs_to :sender
    belongs_to :days_to_ship

    validates :name,  presence: true
    validates :price, presence: true,  format: { with: /\A[\d]+\z/, message: "金額は半角数字で入力して下さい" }
    validates_inclusion_of :price, numericality: {only_integer: true}, in: 300..9999999
    with_options numericality: { other_than: 1, item: "can't be blank"}do
    validates :category_id, presence: true
    validates :item_status_id, presence: true
    validates :delivery_change_id, presence: true
    validates :sender_id, presence: true
    validates :days_to_ship_id, presence: true
    end
    validates :comment, presence: true
    validates :image, presence: true

    def was_attached?
      self.image.attached?
    end
    after(:build) do |item|
      item.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
end
