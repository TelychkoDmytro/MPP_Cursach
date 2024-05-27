class CreateBlacklist < ActiveRecord::Migration[7.0]
  def change
    create_table :blacklists do |t|
      t.integer :user_id, null: false
      t.string :reason, null: false
      t.datetime :banned_at, null: false
      t.datetime :ban_duration
      t.boolean :is_permanent, null: false

      t.timestamps
    end
    add_index :blacklists, :user_id, name: "Blacklist_Users_FK"
  end
end
