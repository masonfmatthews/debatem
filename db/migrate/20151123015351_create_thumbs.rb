class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.integer :user_id
      t.integer :claim_id
      t.boolean :up

      t.timestamps null: false
    end
  end
end
