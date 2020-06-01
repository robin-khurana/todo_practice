class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    if get_due_date < Date.today
      redirect_to @todo_list , notice: "Kindly change the due date"
    else
      @todo_item = @todo_list.todo_items.create(todo_item_params)
      redirect_to @todo_list
    end
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success] = "Todo List item was deleted."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @todo_list
  end

  def complete
    @todo_item.item_complete_updation
    redirect_to @todo_list, notice: "Todo item completed"
  end


  private
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end
  def todo_item_params
    params[:todo_item].permit(:content, :due_date)
  end
  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end
  def get_due_date
    Date.new(params[:todo_item]['due_date(1i)'].to_i, params[:todo_item]['due_date(2i)'].to_i, params[:todo_item]['due_date(3i)'].to_i)
  end
end
