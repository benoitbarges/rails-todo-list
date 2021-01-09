class TodosController < ApplicationController
  before_action :set_todo, only: [:destroy, :mark_as_done, :mark_as_not_done, :move]

  def index
    @todos = policy_scope(Todo).order(:position)
    respond_to do |format|
      format.html do
        @todos
      end
      format.json do
        render json: @todos.as_json
      end
    end
  end

  def create
    @todo = Todo.new(todo_params)
    authorize @todo
    @todo.user = current_user
    @todo.save!
    redirect_to root_path
  end

  def destroy
    @todo.destroy
    redirect_to root_path
  end

  def mark_as_done
    @todo.update(done: true)
    redirect_to root_path
  end

  def mark_as_not_done
    @todo.update(done: false)
    redirect_to root_path
  end

  def move
    @todo.insert_at(params[:position].to_i)
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
end
