class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :collections, :user_id
  end
end
