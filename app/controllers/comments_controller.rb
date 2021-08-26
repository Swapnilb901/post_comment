# frozen_string_literal: true

# Comment
class CommentsController < ApplicationController
  before_action :set_post
  def new
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :parent_id)
  end

  def set_post
    @post = Post.where(id: params[:post_id]).first
  end
end
