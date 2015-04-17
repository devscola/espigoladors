class ReceiversController < ApplicationController

  def index
  	@receivers = Receiver.all
  end

  def show
  	@receiver = Receiver.find(params[:id])
  	
  end

  def new
    @receiver = Receiver.new
  end

  def create
  	@receiver = Receiver.new(receiver_params)
  	@receiver.save!
  	flash[:notice] = "Congrats, your receiver order is now created"
  	rescue Exception
  	  render 'new'
  	end

  def edit
  	@receiver = Receiver.find(params[:id])	
  end

  def update
  	@receiver = Receiver.find(params[:id])	
  	@receiver.update_attributes(receiver_params)
  	redirect_to receivers_path	
  end

  def delete
  	@receiver = Receiver.find(params[:id])
  	if @receiver.delete
  		redirect_to receivers_path
  	end
  end

  private 

  def receiver_params
  	params.require(:receiver).permit( :food_type, :quantity, :maximum_storage_time, :address, :time, :people) 
	
  end


end