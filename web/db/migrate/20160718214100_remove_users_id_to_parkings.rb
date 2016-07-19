class RemoveUsersIdToParkings < ActiveRecord::Migration[5.0]
  def change
    remove_column :parkings, :users_id, :int
  end
end
