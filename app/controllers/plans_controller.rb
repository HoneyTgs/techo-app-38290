class PlansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_plan, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @plans = Plan.all
    @plans = Plan.includes(:user)
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to root_path
  end

  def edit
    unless @plan.user_id == current_user.id
      :index
    end
  end

  def update
    plan = Plan.find(params[:id])
    plan.update(plan_params)
  end

  def show
    @comment = Comment.new
    @comments = @plan.comments.includes(:user)
    if Read.create(plan_id: @plan.id, user_id: current_user.id) 
      @read = Read.update(complete: true)
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:title, :text, :category_id).merge(user_id: current_user.id)
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

