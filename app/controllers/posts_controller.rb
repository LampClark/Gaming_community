class PostsController < ApplicationController
  def create
    @discussion = Discussion.find(params[:discussion_id])
    @post = @discussion.posts.build(post_params)
    @post.user = current_user

    if @post.save
      redirect_to discussion_path(@discussion), notice: "Thread posted sucessfully!"
    else
      render 'discussions/show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
