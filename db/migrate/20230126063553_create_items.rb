class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.string     :name
      t.integer    :category_id
      t.integer    :price
      t.integer    :item_state_id
      t.integer    :delivery_change_id
      t.integer    :shipping_place_id
      t.text       :comment
      t.integer    :shipping_area_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
