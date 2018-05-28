class BookingsController < ApplicationController

def index
  @bookings = Booking.all
end

def show
  @booking = Booking.find(params[:id])
end

def new
  @festival = Festival.find(params[:festival_id])
  @booking = Booking.new
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


  def edit
    @festival = Festival.find(params[:festival_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @festival = Festival.find(params[:festival_id])
    @booking = Booking.find(params[:id])
     if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
    render :edit
    end
  end

def destroy
   @festival = Festival.find(params[:festival_id])
   @booking = Booking.find(params[:id])
    if @booking.destroy
    redirect_to bookings_path
    else
    render :destroy
    end
  end
end


private

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :status, :total_price)
end

end
