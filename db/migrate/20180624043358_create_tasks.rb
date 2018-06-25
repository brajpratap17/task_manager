class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	t.text :name
    	t.string :status
    	t.integer :user_id
    	t.integer :project_id
      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :project_id
  end
end
