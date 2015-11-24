class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.integer :user_id
      t.string :title
      t.text :body

      t.timestamps null: false
    end

    add_index :propositions, :user_id
    add_index :propositions, :created_at
  end
end
