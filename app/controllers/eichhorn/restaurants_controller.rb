class Eichhorn::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_eichhorn

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
      redirect_to eichhorn_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to create"
      render :new
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
    end
  end

