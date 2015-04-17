class ProducersController < ApplicationController

  def index
    @producers = Producer.all
  end

  def show
    @producer = Producer.find(params[:id])
  end

  def new
    @producer = Producer.new
    puts @producer
  end

  def create
    @producer = Producer.new(producer_params)
    @producer.save!
    flash[:notice] = "Congratulations, your excedent product has been created"
    redirect_to producers_path
  rescue Exception
    render 'new'
  end

  def edit
    @producer = Producer.find(params[:id])
  end

  def update
    @producer = Producer.find(params[:id])
    @producer.update_attributes(producer_params)
    redirect_to producers_path
  end

  def destroy
    @producer = Producer.find(params[:id])
    if @producer.delete
      redirect_to producers_path
    end
  end

  private

  def producer_params
    params.require(:producer).permit(:food_type, :quantity, :expiration, :address, :schedule)
  end
end