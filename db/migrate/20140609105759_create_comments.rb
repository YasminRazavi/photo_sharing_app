class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user
      t.references :photo

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :photo_id
  end
end
