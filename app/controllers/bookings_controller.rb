class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    find_property
    @booking = Booking.new
  end

  def create
    find_property
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.property = @property
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @property = booking.property
    @booking.destroy
    redirect_to property_path(@property)
  end

  def show
    @bookings = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(booking_params)
    redirect_to property_path(@property)
  end

  private

  def find_property
    @property = Property.find(params[:property_id])
  end

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end, :user_id, :property_id)
  end
end
