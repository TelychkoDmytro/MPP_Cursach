class CreateHobies < ActiveRecord::Migration[7.0]
  def change
    create_table :hobies do |t|
      t.string :title

      t.timestamps
    end
  end
end
