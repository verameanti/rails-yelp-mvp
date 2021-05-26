class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    # display all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # show one restaurant and reviews as well
  end

  def new
    # get new info for restaurant
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
    # create new restaurant and post to database
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end
end
