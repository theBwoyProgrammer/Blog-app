class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
end

def show
  #  @post = Post.find(params[:id])
end
