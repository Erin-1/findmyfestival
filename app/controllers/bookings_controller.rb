class BookingsController < ApplicationController
def index
  @bookings = Booking.all
end

def show
  @bookings = Booking.find(params[:festival_id])
end

def create
  festival = Festival.find(params[:festival_id])
  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.festival = festival
  if @booking.save
    flash[:notice] = "Succes"
    redirect_to festivals_path
  else
    flash[:error] = "Warning, this failed"
    render :new
  end
end


private

def booking_params
  params.require(:booking).permit(:festival_id, :user_id, :start_date, :end_date, :status, :total_price)
end

end
