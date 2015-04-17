class StaticPagesController < ApplicationController

  def home
    @producer = Producer.new
  end
end