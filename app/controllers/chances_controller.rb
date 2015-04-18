class ChancesController < ApplicationController

  def index
    @chances = Chance.all
    @chances = Chance.tagged_with(params[:tag]) if params[:tag]
  end

  def show
    @chance = Chance.find(params[:id])
  end

  def new
    @chance = Chance.new
    @chance.products.build
  end

  def create
    @chance = Chance.new(chance_params)
    @chance.save!
    flash[:notice] = "Congratulations, your excedent product has been created"
    redirect_to chances_check_address_path(@chance.id)
  rescue Exception
    render 'new'
  end

  def edit
    @chance = Chance.find(params[:id])
  end

  def update
    @chance = Chance.find(params[:id])
    @chance.update_attributes(chance_params)
    redirect_to chance_path(params[:id])
  end

  def destroy
    @chance = Chance.find(params[:id])
    if @chance.delete
      redirect_to chances_path
    end
  end
  
  def check_address
    @chance = Chance.find(params[:id])
  end

  private

  def chance_params
    params.require(:chance).permit(:title, :address, :schedule, :email, products_attributes: [:food_type, :quantity, :expiration, :all_tags])
  end

end
