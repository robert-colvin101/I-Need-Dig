class PropertiesController < ApplicationController
  after_validation :geocode, if: :will_save_change_to_address?

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
  end

  def edit
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
    params.require(:property).permit(:address, :name, :city, :rooms, :beds, :price)
  end
end

