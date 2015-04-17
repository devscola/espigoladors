class ProducersController < ApplicationController

  def new
    @producer = Producer.new
    puts @producer
  end
end