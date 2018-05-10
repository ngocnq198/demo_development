class CommentsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
       flash[:success] = "Comment created!"
       redirect_to current_user
    else
      render 'shared/_comment_form'
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if !comment.nil?
      comment.destroy
      flash[:success] = "Comment deleted"
    else
      flash[:warning] = "Comment not found"
    end
      redirect_to request.referrer || root_url
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
