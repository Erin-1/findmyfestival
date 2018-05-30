class DashboardsController < ApplicationController

  def my_festivals
    if current_user.host?
      @festivals = current_user.festivals
      # @festival.each do |fest|
      #   fest.bookings.each do |booking|
      #   end
    end
  end

  def my_trips
    @bookings = current_user.bookings
  end

end
