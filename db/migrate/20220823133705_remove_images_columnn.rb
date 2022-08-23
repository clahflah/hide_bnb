class RemoveImagesColumnn < ActiveRecord::Migration[7.0]
  def change
    remove_column :listings, :images
  end
end
