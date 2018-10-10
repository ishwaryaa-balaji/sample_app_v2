class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_rate
      t.string :author_name

      t.timestamps
    end
  end
end
