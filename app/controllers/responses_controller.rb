class ResponsesController < ApplicationController
  before_filter :get_parent
   
  def index
    @responses = Response.find(params[:response_id])
  end
  
  def show
    @responses = Response.build(params[:response_id])
  end
  
  def new
    @response = @parent.responses.build
  end

  def home
    @latest_feed = Feed.order(:id).last
  end

  def edit
    @feed = Feed.find(params[:feed_id])
    @response = @parent.responses.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:feed_id])
    @response = @parent.responses.find(params[:id])
    
    if @response.update(response_params)
      redirect_to feed_path(@response.feed), notice: 'Response was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @response = @parent.responses.build(response_params)
    @response.user_id = current_user.id
    
    if @response.save
      redirect_to feed_path(@response.feed), :notice => 'Thank you for your response!'
    else
      render :new
    end
  end
  
  def destroy  
    @response = Response.find(params[:id])

    @response.destroy
    redirect_to feed_path(@response.feed), notice: "Response deleted."
  end
 
  private
  
  def response_params
    params.require(:response).permit(:body)
  end
  
  def get_parent
    @parent = Feed.find_by_id(params[:feed_id]) if params[:feed_id]
    @parent = Response.find_by_id(params[:response_id]) if params[:response_id]
     
    redirect_to root_path unless defined?(@parent)
  end
end
