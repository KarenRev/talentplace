class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy edit update]

  def new
    @booking = Booking.new
    @talent = Talent.find(params[:talent_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.place = current_place
    @booking.talent = Talent.find(params[:talent_id])
    @booking.status = 'pending'

    if @booking.save
      redirect_to place_dashboard_path, notice: 'Booking completed, wait for the anwer.'
    else
      render :new
    end
  end

  def update
    @booking.status = params[:status]
    @booking.save
    redirect_to talent_dashboard_path
  end

  def destroy
    @booking.destroy
    redirect_to place_dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :message)
  end
end
