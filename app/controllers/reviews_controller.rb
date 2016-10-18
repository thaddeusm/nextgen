class ReviewsController < ApplicationController
  before_filter :get_parent
   
  def index
    @reviews = Review.find(params[:review_id])
  end
  
  def show
    @reviews = Review.build(params[:review_id])
  end
  
  def new
    @review = @parent.reviews.build
  end

  def home
    @latest_feed = Plan.order(:id).last
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    
    if @review.update(review_params)
      redirect_to plan_path(@review.plan), notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @review = @parent.reviews.build(review_params)
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to plan_path(@review.plan), :notice => 'Thank you for your review!'
    else
      render :new
    end
  end
  
  def destroy  
    @review = Review.find(params[:id])

    @review.destroy
    redirect_to plan_path(@review.plan), notice: "Review deleted."
  end
 
  private
  
  def review_params
    params.require(:review).permit(:body)
  end
  
  def get_parent
    @parent = Plan.find_by_id(params[:plan_id]) if params[:plan_id]
    @parent = Review.find_by_id(params[:review_id]) if params[:review_id]
     
    redirect_to root_path unless defined?(@parent)
  end
end
