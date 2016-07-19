class AddCostoDiaToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :costo_dia, :double
  end
end
