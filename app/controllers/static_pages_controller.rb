class StaticPagesController < ApplicationController

  def home
    @chance = Chance.new
  end
end