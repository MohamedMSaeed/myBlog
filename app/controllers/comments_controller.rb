class CommentsController < ApplicationController
  before_action :set_post, only: :create

  def create
    @comment = @post.comments.build(comment_params)
    if current_user
      @comment.user_id = current_user.id
    end

    if @comment.save
      flash[:notice] = "Comment has been created"
    else
      flash[:alert] = "Comment has not been created"
    end
    redirect_to post_path(@post)
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    # unless @comment.user === current_user
    #   flash_message = "Only the owner can edit the comment."
    #   flash[:alert] = flash_message
    #   redirect_to article_path(@article)
    # else
      if @comment.update(comment_params)
        flash[:success] = "comment has been updated"
        redirect_to post_path(@post)
      else
        flash.now[:danger] = "comment has not been updated"
        render :edit
      end
    # end
  end

  def destroy
    @comment = Comment.find(params[:post_id])
    @post = Post.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def edit
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:post_id])
    # format.html { redirect_to edit_comment_path(@comment), method: :get }
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
