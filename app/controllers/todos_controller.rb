class TodosController < ApplicationController

  def index
    @todos = policy_scope(Todo)
  end

  def create
    @todo = Todo.new(todo_params)
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :done, :deadline)
  end
end
