# frozen_string_literal: true

# Post
class PostsController < ApplicationController
  before_action :set_post, except: [:index]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.image.attach(params[:post][:image])
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post.image.attach(params[:post][:image])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def like_post
    like = @post.check_like?(current_user)
    if like
      like.destroy
    else
      Like.create(user_id: current_user.id, post_id: @post.id)
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.where(id: params[:id]).first
  end
end
