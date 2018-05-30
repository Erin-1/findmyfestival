class DashboardsController < ApplicationController

  def my_festivals
    if current_user.host?
      @festivals = Festival.where(user_id: current_user)
    end
    @bookings = current_user.bookings
  end

  def my_trips
   @bookings = Booking.where(user_id: current_user)
  end



  # select all the festival created by current user
  # from festivals get all the bookings

  def my_guests
   @festivals = Festival.where(user: current_user)

  end

end
