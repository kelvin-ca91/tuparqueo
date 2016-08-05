class AddCostoAnhoToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :costo_anho, :decimal
  end
end
