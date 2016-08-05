class AddCostoMesToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :costo_mes, :decimal
  end
end
