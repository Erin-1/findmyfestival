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
    @festival = Festival.new(params[:festival])
    @festival.save
  end

  def edit
    @festival = Festival.new(params[:id])
  end

  def update
    @festival = Festival.find(params[:id])
    @festival.update(params[:festival])
  end

  def destroy
    @festival = Festival.find(params[:id])
    @festival.destroy

  end

  private


end
