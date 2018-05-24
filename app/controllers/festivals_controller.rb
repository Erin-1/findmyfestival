class FestivalsController < ApplicationController
  def index
    @festivals = Festival.all
  end

  def show
    @festival = Festival.find(params[:id])
  end

  def new
    @festival = Festival.new
  end

  def create
    @user = User.new(params[:user_id])
    @festival = Festival.new(festival_params)
    @festival.user = @user
    if
    @festival.save
    redirect_to festival_path(@festival)
    else
    render :new
    end
  end

  def edit
    @festival = Festival.new(festival_params)
  end

  def update
    @festival = Festival.find(params[:user_id])
    @festival.update(festival_params)
    @festival.user = @user
    if
    @festival.save
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
    params.require(:festival).permit(:title, :description)
  end


end
