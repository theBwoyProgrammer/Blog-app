class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes([:author])
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments.includes([:author])
  end

  def new
    @id = current_user.id
    @post = Post.new
  end

  def create
    post = Post.new(title: post_params[:title], text: post_params[:text], author: current_user)
    if post.save
      flash[:success] = "Great! Your post has been created!"
      redirect_to user_posts_path
    else
      flash.now[:error] = "Rats! A mistake occured, Fix it please."
       render :new, status: :unprocessable_entity
  end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
