class DiscussionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.all
  end

  def show
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = current_user.discussions.build(discussion_params)
    @discussion.attachments.attach(params[:discussion][:attachment])

    if @discussion.save
      redirect_to @discussion, notice: "Listing was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @discussion.update(discussion_params)
      redirect_to @discussion, notice: "discussion was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @discussion.destroy
    redirect_to discussions_path, notice: "Discussion was successfully destroyed."
  end
end

private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:title, :description, attachments: [])
  end
