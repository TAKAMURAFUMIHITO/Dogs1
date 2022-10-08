class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
end