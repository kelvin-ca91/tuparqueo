class AddLatitudlongitudToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :latitud, :string
    add_column :parkings, :longitud, :string
  end
end
