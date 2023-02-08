FactoryBot.define do
  factory :order_address do
    post_number { '123-4567' }
    sender_id { 2 }
    city { '新宿区' }
    addresses { '大久保1-1' }
    building { '東京ハイツ' }
    phone_number { '00000000000' }

    association :user
  end
end
