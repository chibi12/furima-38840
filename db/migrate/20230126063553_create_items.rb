class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.string     :name
      t.text       :comment
      t.integer    :category_id
      t.integer    :item_status_id
      t.integer    :delivery_change_id
      t.integer    :sender_id
      t.integer    :days_to_ship_id
      t.integer    :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
