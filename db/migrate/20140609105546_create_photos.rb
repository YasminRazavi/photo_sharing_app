class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :caption
      t.references :user
      t.references :collection
      t.text :image

      t.timestamps
    end
    add_index :photos, :user_id
    add_index :photos, :collection_id
  end
end
