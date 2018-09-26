class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def create
    @bike = Bike.new(bike_params)

    respond_to do |format|
      if @bike.save
        format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @bike = Bike.find(params[:id])

    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to @bike, notice: 'Bike was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @bike = Bike.find(params[:id])

    respond_to do |format|
      format.html { redirect_to bikes_url, notice: 'Bike was successfully destroyed.' }
    end
  end

  private

    def bike_params
      params.require(:bike).permit(:name, :available)
    end
end
