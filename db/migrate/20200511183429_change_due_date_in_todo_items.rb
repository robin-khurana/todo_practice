class ChangeDueDateInTodoItems < ActiveRecord::Migration[5.1]
  def change
    change_column :todo_items, :due_date, :date
  end
end
