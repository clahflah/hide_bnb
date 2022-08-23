class ChangeImageToImages < ActiveRecord::Migration[7.0]
  def change
    rename_column :listings, :image, :images
  end
end
