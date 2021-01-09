class TodosController < ApplicationController

  def index
    @todos = policy_scope(Todo)
  end
end
