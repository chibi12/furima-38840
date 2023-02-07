class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :sender_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id, :item_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :sender_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :phone_number, format: {with: /\A[\d]\z/, message: "can't be blank"}
    end
    validates :city, :addresses, presence: true

    def save
        # addressesを保存し、変数orderに代入する
        order = Order.create(item_id: item.id, user_id: user.id)
        # 住所を保存する
        # order_idには、変数orderのidと指定する
        Address.create(post_number: post_number, sender_id: sender.id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
    end
end