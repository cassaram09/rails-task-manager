class CreateTaskTags < ActiveRecord::Migration
  def change
    create_table :task_tags do |t|

      t.timestamps null: false
    end
  end
end
