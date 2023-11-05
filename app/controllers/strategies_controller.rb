class StrategiesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.where(category: 'strategies')
    render 'discussions/strategies/index'  # Renders the index view for strategies
  end

  def show
    render 'discussions/strategies/show'  # Renders the show view for strategies
  end

  def new
    @discussion = Discussion.new
    render 'discussions/strategies/new'  # Renders the new discussion view for strategies
  end

  def create
    @discussion = current_user.discussions.build(discussion_params)
    @discussion.category = 'strategies'  # Assign the category to 'strategies'
    @discussion.attachments.attach(params[:discussion][:attachment])

    if @discussion.save
      redirect_to strategy_path(@discussion), notice: "Discussion was successfully created."
    else
      render 'discussions/strategies/new'
    end
  end

  def edit
    render 'discussions/strategies/edit'  # Renders the edit view for strategies
  end

  def update
    if @discussion.update(discussion_params)
      redirect_to strategy_path(@discussion), notice: "Discussion was successfully updated."
    else
      render 'discussions/strategies/edit'
    end
  end

  def destroy
    @discussion.destroy
    redirect_to strategies_path, notice: "Discussion was successfully destroyed."
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:title, :description, attachments: [])
  end
end
