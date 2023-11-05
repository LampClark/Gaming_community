class GeneralDiscussionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.where(category: 'discussions')
    render 'discussions/general_discussions/index'
  end

  def show
    render 'discussions/general_discussions/show'
  end

  def new
    @discussion = Discussion.new
    render 'discussions/general_discussions/new'
  end

  def create
    @discussion = current_user.discussions.build(discussion_params)
    @discussion.category = 'discussions'
    @discussion.attachments.attach(params[:discussion][:attachment])

    if @discussion.save
      redirect_to general_discussion_path(@discussion), notice: "Listing was successfully created."
    else
      render 'discussions/general_discussions/new'
    end
  end

  def edit
    render 'discussions/general_discussions/edit'
  end

  def update
    if @discussion.update(discussion_params)
      redirect_to general_discussion_path(@discussion), notice: "discussion was successfully updated."
    else
      render "discussions/general_discussions/edit"
    end
  end

  def destroy
    @discussion.destroy
    redirect_to general_discussions_path, notice: "Discussion was successfully destroyed."
  end
end

private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:title, :description, attachments: [])
  end
