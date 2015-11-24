class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.integer :user_id
      t.integer :claim_id
      t.boolean :up

      t.timestamps null: false
    end
    add_index :thumbs, :user_id
    add_index :thumbs, :claim_id
  end
end
