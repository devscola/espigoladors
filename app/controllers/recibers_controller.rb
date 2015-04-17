class ProducersController < ApplicationController

  def new
    @reciber = Reciber.new
  end
end