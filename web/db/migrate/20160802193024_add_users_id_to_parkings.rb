class AddUsersIdToParkings < ActiveRecord::Migration[5.0]
  def change
    add_column :parkings, :users_id, :integer
    add_column :parkings, :estado, :integer
  end
end
