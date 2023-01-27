class Item < ApplicationRecord
    belongs_to :user
    has_many :purchases
    has_one_attached :image
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :genre

    validates :name, :price, :comment, presence: true
    validates :genre_id, numericality: { other_than: 1, message: "can't be blank"} 
end
