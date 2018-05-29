class DashboardsController < ApplicationController

  def index
    if current_user.host?
      @festivals = Festival.where(user_id: current_user)
    end
    @bookings = current_user.bookings
  end


end
