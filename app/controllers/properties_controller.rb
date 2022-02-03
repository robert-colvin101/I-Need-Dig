class PropertiesController < ApplicationController
  # after_validation :geocode, if: :will_save_change_to_address?

  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @property = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
      if @property.save
        redirect_to property_path(@property)
      else
        render :new
      end
  end

  def show
    @property = Property.find(params[:id])
    @booking = Booking.new
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property.update(property_params)
    if @property.save
      redirect_to property_path(@property)
    else redirect_to edit_property_path(@property)
    end
  end

  def destroy
    @property.destroy
    redirect_to property_path
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :name, :city, :rooms, :beds, :price, :description)
  end
end

