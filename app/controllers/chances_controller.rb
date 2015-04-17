class ChancesController < ApplicationController

  def index
    @chances = Chance.all
  end

  def show
    @chance = Chance.find(params[:id])
  end

  def new
    @chance = Chance.new
  end

  def create
    @chance = Chance.new(chance_params)
    @chance.save!
    flash[:notice] = "Congratulations, your excedent product has been created"
    redirect_to chances_path
  rescue Exception
    render 'new'
  end

  def edit
    @chance = Chance.find(params[:id])
  end

  def update
    @chance = Chance.find(params[:id])
    @chance.update_attributes(chance_params)
    redirect_to chances_path
  end

  def destroy
    @chance = Chance.find(params[:id])
    if @chance.delete
      redirect_to chances_path
    end
  end

  private

  def chance_params
    params.require(:chance).permit(:title, :address, :schedule)
  end
end