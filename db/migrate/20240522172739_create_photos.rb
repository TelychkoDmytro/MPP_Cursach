class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :media_type
      t.string :media_path
      t.string :description

      t.timestamps
    end
  end
end
