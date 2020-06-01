class AddDueDateToTodoItems < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_items, :due_date, :datetime
  end
end
