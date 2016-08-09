class AddImageFileNameToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :image_file_name, :string
    add_column :parkings, :file_name, :string
  end
end
