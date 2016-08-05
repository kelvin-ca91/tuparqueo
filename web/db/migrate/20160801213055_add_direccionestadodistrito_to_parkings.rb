class AddDireccionestadodistritoToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :direccion, :string
    add_column :parkings, :districts_id, :integer
    add_column :parkings, :estado, :integer
  end
end
