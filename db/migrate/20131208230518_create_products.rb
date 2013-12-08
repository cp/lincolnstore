class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string   :name, required: true
      t.string   :description
      t.string   :image_url
      t.string   :stripe_id
      t.integer  :price
      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
