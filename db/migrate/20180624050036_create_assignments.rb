class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
    	t.integer :user_id
    	t.integer :project_id
      t.timestamps
    end
    add_index :assignments, :user_id
    add_index :assignments, :project_id
  end
end
