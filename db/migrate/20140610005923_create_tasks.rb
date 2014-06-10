class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :list_id
      t.boolean :mark, :default => false

      t.timestamps
    end
    add_index :tasks, [:list_id, :created_at]
  end
end
