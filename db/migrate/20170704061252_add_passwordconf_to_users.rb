class AddPasswordconfToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passwordconf, :string
  end
end
