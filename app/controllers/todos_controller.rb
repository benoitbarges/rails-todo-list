class TodosController < ApplicationController
  before_action :set_todo, only: [:destroy, :toggle_done :move, :update_deadline]
  before_action :set_todos, only: [:index, :move]

  def index
  end

  def create
    @todo = Todo.new(todo_params)
    authorize @todo
    @todo.user = current_user
    if @todo.save
      redirect_to root_path(anchor: "todo-#{@todo.id}")
    else
      render json: @todo.errors.messages
    end
  end

  def destroy
    @todo.destroy
  end

  def toggle_done
    @todo.update(done: !@todo.done)
  end

  def move
    @todo.insert_at(params[:position].to_i)
    render json: @todos
  end

  def update_deadline
    @todo.update(deadline: params[:deadline].to_date)
    head :ok
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :done, :deadline)
  end

  def set_todo
    @todo = Todo.find(params[:id])
    authorize @todo
  end

  def set_todos
    @todos = policy_scope(Todo).order(:position)
  end
end
