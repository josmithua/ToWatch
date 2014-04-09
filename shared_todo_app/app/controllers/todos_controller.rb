class TodosController < ApplicationController
  def index
		@todo_items = Todo.all
		@new_todo = Todo.new
  end

  def delete
		params[:todos_checkbox].each do |check|
			todo_id = check
			t = Todo.find_by_id(todo_id)
			t.delete
		end
		redirect_to index_path
  end

  def add
		debugger
		todo = Todo.create(:todo_item => params[:todo][:todo_item])
		unless todo.valid?
			flash[:error] = todo.errors.full_messages.join("<br>").html_safe
		else
			flash[:success] = "Todo added successfully"
		end
		redirect_to index_path
  end

  def complete
	  if params[:delete_todos]
			params[:todos_checkbox].each do |check|
				todo_id = check
				t = Todo.find_by_id(todo_id)
				t.delete
				flash[:success] = "Todo(s) deleted successfully"
			end
	  else
			params[:todos_checkbox].each do |check|
				todo_id = check
				t = Todo.find_by_id(todo_id)
				t.update_attribute(:completed, !t.completed)
			end
		end
		redirect_to index_path
	end #complete

  private
      def todo_params
          params.require(:todo).permit(:todo_item, :todo_id, :todos_checkbox, :delete_todos)
      end
      
end #class
