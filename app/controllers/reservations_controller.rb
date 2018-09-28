class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def reservation_ajax
    @reservations = Reservation.all
    render json: @reservations.to_json(include: { employee: { methods: [:full_name] }, bike: { methods: [:name]} })
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def reservation_params
      params.require(:reservation).permit(:starting, :till, :employee_id, :bike_id)
    end
end
