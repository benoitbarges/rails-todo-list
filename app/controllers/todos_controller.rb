class TodosController < ApplicationController
  before_action :set_todo, only: [:destroy]

  def index
    @todos = policy_scope(Todo)
  end

  def create
    @todo = Todo.new(todo_params)
  end

  def destroy
    @todo.destroy
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :done, :deadline)
  end

  def set_todo
    @todo = Todo.find(params[:id])
    authorize @todo
  end
end
