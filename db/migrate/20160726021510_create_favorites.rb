class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :users_id
      t.integer :parkings_id

      t.timestamps
    end
  end
end
