class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]
  def index
    if current_user.type == 'AdminUser'
      @posts = Post.all.page(params[:page]).per(10)
    else
      @posts = Post.posts_by(current_user).page(params[:page]).per(10)
    end
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: 'The post was has been approved'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'post is created'
    else
      render 'new'
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
    
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post is deleted'
  end
  

  private
    def post_params
      params.require(:post).permit(:date, :rationale, :status, :overtime_request)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
