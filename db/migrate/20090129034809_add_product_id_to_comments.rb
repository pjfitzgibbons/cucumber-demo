class AddProductIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :product_id, :integer
  end

  def self.down
    remove_column :comments, :product_id
  end
end
