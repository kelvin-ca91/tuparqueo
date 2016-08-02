class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.integer :users_id
      t.integer :parkings_id
      t.date :fecha_inicio
      t.date :fecha_fin
      t.decimal :monto
      t.integer :cant_tiempo
      t.string :tiempo
      t.integer :estado

      t.timestamps
    end
  end
end
