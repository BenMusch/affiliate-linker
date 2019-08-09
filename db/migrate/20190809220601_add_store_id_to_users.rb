class AddStoreIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :store_id, :string
  end
end
