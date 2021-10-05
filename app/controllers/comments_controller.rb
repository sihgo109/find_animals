class CommentsController < ApplicationController
  def create
    @animal = Animal.find(params[:animal_id])
    @comment = Comment.create(comment_params)
    if @comment.save
       redirect_to animal_path(@animal)
   else
      @animal = @comment.animal
      @comments = @animal.comments
      render "/animals/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, animal_id: params[:animal_id])
  end
end