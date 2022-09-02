class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end
    def show
        @restaurant = Restaurant.find(params[:id])
    end
    def new
        @restaurant = Restaurant.new
    end
    def create
        @restaurant = Restaurant.new(params_permit)
        @restaurant.save
        redirect_to restaurant_path(@restaurant)
    end
    def edit
        @restaurant = Restaurant.find(params[:id])
    end
    def update
        @restaurant = Restaurant.find(params[:id])
        @restaurant.update(params_permit)
        redirect_to restaurant_path(@restaurant)
    end
    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to restaurants_path, status: :see_other
      end
    private

    def params_permit
        params.require(:restaurant).permit(:name, :rating, :address)
    end
end
