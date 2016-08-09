class AddImageToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :image, :text
  end
end
