class FestivalsController < ApplicationController
  def index
    @festival = Festival.all
  end

  def show
    @festival = Festival.find(params[:id])
  end

  def new
    @festival = Festival.new
  end

  def create
    @festival = Festival.new(festival_params)
    # if
    @festival.save
    # redirect_to festivals_path
    # else
    # render :new
    # end
  end

  def edit
    @festival = Festival.new(params[:id])
  end

  def update
    @festival = Festival.find(params[:id])
    if
    @festival.update(festival_params)
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


end
