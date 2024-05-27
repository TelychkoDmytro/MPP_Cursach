class CreatePostReports < ActiveRecord::Migration[7.0]
  def change
    create_table :post_reports do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.string :reason, null: false
      t.datetime :reported_at, null: false
      t.column :status, "ENUM('pending', 'resolved')", null: false

      t.timestamps
    end
    add_index :post_reports, :post_id, name: "PostReports_Posts_FK"
    add_index :post_reports, :user_id, name: "PostReports_Users_FK"
  end
end

