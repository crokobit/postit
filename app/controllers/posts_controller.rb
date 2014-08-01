class PostsController < ApplicationController
  def index
    @posts = PostDecorator.decorate_collection(Post.all)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


  def post_params
    params.require(:post).permit(:url, :title, :description, :id)
  end
end
