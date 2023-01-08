class DestinationsController < ApplicationController

  def index
    @destination = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def create
    #whitelisting the params
    @destination = Destination.new(params.require(:destination).permit(:country, :city, :description))
    #save to db
    @destination.save
    redirect_to destination_path(@destination)
  end

end