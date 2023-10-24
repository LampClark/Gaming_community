class DiscussionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def index
    @discussions = Discussion.all
  end

  def show
    @discussion = Discussion.find(params[:id])
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
  end

  def destroy
  end
end

private

  def discussion_params
    params.require(:discussion).permit(:title, :description, :attachment)
  end
