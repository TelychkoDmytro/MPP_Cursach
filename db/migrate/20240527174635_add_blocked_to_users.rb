class AddBlockedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :blocked, :boolean, false
  end
end
