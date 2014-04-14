class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to new_manufacturer_url,
      notice: 'Manufacturer has been added'
    else
      render 'new'
    end
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(
      :name,
      :country
      )
  end
end
