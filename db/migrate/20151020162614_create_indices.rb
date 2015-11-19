class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      add_index :propositions, :user_id
    end
  end
end
