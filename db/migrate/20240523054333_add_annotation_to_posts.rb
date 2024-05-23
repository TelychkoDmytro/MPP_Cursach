class AddAnnotationToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :annotation, :string
  end
end
