class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      add_index :proposals, :user_id
      add_index :positions, :user_id
      add_index :positions, :parent_id
      add_index :positions, :proposal_id
    end
  end
end
