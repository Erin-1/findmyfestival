class FestivalsController < ApplicationController
  def index
    # @festivals = Festival.all
    if current_user.host?
      @festivals = Festival.where.not(latitude: nil, longitude: nil, user_id: current_user)
    else
      @festivals = Festival.where.not(latitude: nil, longitude: nil)
      @markers = @festivals.map do |festival|
        {
          lat: festival.latitude,
          lng: festival.longitude#,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    end
  end

  def show
    @festival = Festival.find(params[:id])
    @markers = [{
        lat: @festival.latitude,
        lng: @festival.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
  end

  def new
    @festival = Festival.new
  end

  def create

    @festival = Festival.new(festival_params)
    @festival.user = current_user
    if @festival.save
      current_user.role = "host"
      current_user.save
    redirect_to festival_path(@festival)
    else
    render :new
    end
  end

  def edit
    @festival = Festival.find(params[:id])
  end

  def update

    @festival = Festival.find(params[:id])
    if @festival.update(festival_params)
    redirect_to festival_path(@festival)
    else
    render :edit
    end
  end

  def destroy
    @festival = Festival.find(params[:id])
    if
    @festival.destroy
    redirect_to festivals_path
    else
    render :show
    end
  end

  private

  def festival_params
    params.require(:festival).permit(:title, :description, :address, :price, :photo, :photo_cache)
  end


end
