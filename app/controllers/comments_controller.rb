class CommentsController < ApplicationController
  def new
    @id = current_user.id
    @comment = Comment.new
  end

  def create
    # comment = Comment.new(author_id: current_user.id, post_id: post.id, text: comments_params[:text])
    # if comment.save
    #   flash[:notice] = 'Comment created successfully'
    # else
    #   flash[:error] = 'Error'
    # end
    # redirect_to user_post_comments_path

    @comment = Comment.new(comments_params)
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy
    @post.save
    flash[:notice] = 'Comment deleted successfully'
    redirect_to { user_posts(current_user.id) }
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
