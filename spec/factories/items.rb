FactoryBot.define do
    factory :item do
      name               {Faker::Lorem.word}
      comment            {Faker::Lorem.sentence}
      price              { 300 }
      sender_id          { 2 }
      category_id        { 2 }
      item_status_id     { 2 }
      days_to_ship_id    { 2 }
      delivery_change_id { 2 }


      association :user
      
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    end
  end