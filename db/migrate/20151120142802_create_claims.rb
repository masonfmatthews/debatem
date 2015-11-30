class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.integer :proposition_id
      t.text :claim
      t.string :data_url
      t.text :warrant
      t.integer :user_id
      t.boolean :positive
      t.integer :parent_id
      t.float :score_cache

      t.timestamps null: false
    end

    add_index :claims, :user_id
    add_index :claims, :proposition_id
    add_index :claims, :parent_id
  end
end
