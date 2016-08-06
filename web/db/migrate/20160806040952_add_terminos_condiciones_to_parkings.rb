class AddTerminosCondicionesToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :terminos_condiciones, :text
  end
end
