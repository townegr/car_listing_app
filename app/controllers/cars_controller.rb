class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_url,
      notice: 'Your car was added'
    else
      render 'new'
    end
  end

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def destroy
    @car = Car.find(params[:id])
    @car.delete
    redirect_to cars_url
  end

  private
  def car_params
    params.require(:car).permit(
      :color,
      :year,
      :mileage,
      :description,
      :manufacturer_id
      )
  end
end
