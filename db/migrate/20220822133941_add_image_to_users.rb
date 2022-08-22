class AddImageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :image, :string
    add_column :users, :bio, :string
  end
end
