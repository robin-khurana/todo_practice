class AddStatusToTodoItems < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_items, :status, :Integer
  end
end
