class AddPhotoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :photo, foreign_key: true
  end
end
