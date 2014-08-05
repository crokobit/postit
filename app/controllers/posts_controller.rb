class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :vote_up, :vote_down]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_sign_in, except: [:index]

  def index
    @posts = PostDecorator.decorate_collection(Post.all)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    @post.category_ids = params[:post][:category_ids]
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @post.creator = current_user
    @post.category_ids = params[:post][:category_ids]
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = CommentDecorator.decorate_collection(@post.comments)
  end

  def vote_up
    vote = @post.vote_up(current_user)
    flash[:alert] = "already voted" unless vote.valid?
    redirect_to :back
  end

  def vote_down
    vote = @post.vote_down(current_user)
    flash[:alert] = "already voted" unless vote.valid?
    redirect_to :back
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:url, :title, :description)
  end

  def require_same_user
    if  logged_in? && @post.creator.id != current_user.id
      flash[:error] = "need be same user to do that"
      redirect_to root_path
    end
  end
end
