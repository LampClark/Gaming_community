class PostsController < ApplicationController
  def create
    @discussion = Discussion.find(params[:discussion_id])

    if @discussion
      @post = @discussion.posts.build(post_params)
      @post.user = current_user

      if @post.save
        redirect_to general_discussion_path(@discussion), notice: "Thread posted successfully!"
      else
        render 'discussions/general_discussions/show'
      end
    else
      # Discussion not found
      redirect_to not_found_path, alert: "Discussion not found"
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
