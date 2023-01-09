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
    if @destination.save
      flash[:notice] = 'Destination saved succesfully'
      redirect_to destination_path(@destination)
    else
      render :new
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(params.require(:destination).permit(:country, :city, :description))
      flash[:notice] = 'Destination was updated sucessfully'
      redirect_to @destination
    else
      render 'edit'
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    flash[:notice] = 'Destination was deleted successfully'
    redirect_to destination_path
  end
  
end