class DestinationsController < ApplicationController

  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destination = Destination.all
  end

  def show
  end

  def new
    @destination = Destination.new
  end

  def create
    #whitelisting the params
    @destination = Destination.new(destination_params)
    #save to db
    if @destination.save
      flash[:notice] = 'Destination saved succesfully'
      redirect_to destination_path(@destination)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @destination.update(destination_params)
      flash[:notice] = 'Destination was updated sucessfully'
      redirect_to @destination
    else
      render 'edit'
    end
  end

  def destroy
    @destination.destroy
    flash[:notice] = 'Destination was deleted successfully'
    redirect_to destinations_path
  end
  
  private
  
  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:image, :country, :city, :description)
  end
end
