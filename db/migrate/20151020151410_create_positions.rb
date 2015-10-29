class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.integer :proposal_id
      t.integer :parent_id
      t.string :title
      t.text :body
      t.boolean :agree
      t.boolean :agree_with_proposal

      t.timestamps null: false
    end
  end
end
