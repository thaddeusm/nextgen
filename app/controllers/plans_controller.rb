class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def edit
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
      if @plan.save
        redirect_to @plan, notice: 'Your lesson plan was successfully created.'
      else
        render :new
      end
  end

  def update
      if @plan.update(plan_params)
        redirect_to @plan, notice: 'Your lesson plan was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @plan.destroy
      redirect_to plans_url, notice: 'Plan was successfully destroyed.'
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:topic, :goal, :materials, :listening, :speaking, :reading, :writing, :assessment, :user_id)
    end
end
