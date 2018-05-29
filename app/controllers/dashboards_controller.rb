class DashboardsController < ApplicationController

  def my_festivals
    if current_user.host?
      @festivals = Festival.where(user_id: current_user)
    end
    @bookings = current_user.bookings
  end

  def my_trips
   if current_user.host?
   @bookings = Booking.where(user_id: current_user)
  end
end

end
