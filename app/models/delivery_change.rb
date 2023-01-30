class DeliveryChange < ActiveHash::Base
    self.data = [
      { id: 1,  delivery_change: '---' },
      { id: 2,  delivery_change: '着払い(購入者負担)' },
      { id: 3,  delivery_change: '送料込み(出品者負担)' },
    ]

    include ActiveHash::Associations
  has_many :items

 end