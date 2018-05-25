class FestivalsController < ApplicationController
  def index
    @festivals = Festival.all
      @festivals = Festival.where.not(latitude: nil, longitude: nil)

    @markers = @festivals.map do |festival|
      {
        lat: festival.latitude,
        lng: festival.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @festival = Festival.find(params[:id])
    @markers = [
        lat: @festival.latitude,
        lng: @festival.longitude
      ]
  end

  def new
    @festival = Festival.new
  end

  def create
  #   @user = User.new(params[:user_id])
    @festival = Festival.new(festival_params)
    @festival.user = current_user
    if @festival.save
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
    render :destroy
    end
  end

  private

  def festival_params
    params.require(:festival).permit(:title, :description, :photo)
  end


end
