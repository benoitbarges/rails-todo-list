class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    authorize  @comment
    @todo = Todo.find(params[:todo_id])
    @comment.todo = @todo

    respond_to do |format|
      if @comment.save
        format.js
      else
        format.json { render json: @comment.errors.messages }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end



