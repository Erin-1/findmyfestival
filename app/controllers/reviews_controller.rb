class ReviewsController < ApplicationController
   def index
    @reviews = Review.all
  end

 def show
    @review = Review.find(params[:id])
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
  booking = Booking.find(params[:booking_id])
  @review = Review.new(review_params)
  @review.booking = booking
  if @review.save
  redirect_to review_path(@review)
  else
  render :new
  end
  end

 def edit
  @review = Review.find(params[:id])
 end

 def update
  @review = Review.find(params[:id])
  if @review.update(review_params)
    redirect_to review_path(@review)
  else
  render :new
  end
 end

 def destroy
  @review = Review.find(params[:id])
  if @review.destroy
    redirect_to dashboards_my_trips_path
  else
    render :show
 end
end



private

def review_params
params.require(:review).permit(:content, :stars)
end
end
