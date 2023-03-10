class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number,   null: false
      t.integer :sender_id,    null: false 
      t.string :city,          null: false
      t.string :addresses,     null: false
      t.string :building,      null: false
      t.string :phone_number, null: false
      t.references :order,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
