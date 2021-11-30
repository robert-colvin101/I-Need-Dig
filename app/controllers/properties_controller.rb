class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
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

