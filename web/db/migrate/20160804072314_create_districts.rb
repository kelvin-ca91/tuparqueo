class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :nombre
      t.string :lat_centro
      t.string :lon_centro

      t.timestamps
    end
  end
end
