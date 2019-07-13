class CommentsController < ApplicationController

  def create
    @parent = parent
    @comment = @parent.comments.new comment_params

    respond_to do |format|
      if @comment.save
        format.html { redirect_to question_path(@parent.question_id) } if @comment.commentable_type == 'Answer'
        format.html { redirect_to question_path(@parent) } if @comment.commentable_type == 'Question'
        format.js { flash.now[:success] = 'Comentario exitoso' }
      else
        format.html { 'questions/show' }
        format.js
      end
    end

  end

  private

  def parent
    if params[:question_id]
      Question.find(params[:question_id])
    else
      Answer.find(params[:answer_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

end
