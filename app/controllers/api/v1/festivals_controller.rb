class Api::V1::FestivalsController < ApplicationController
  def index
    @festivals = Festival.all
  end

  def show
  end

  def create
  end



  private

end
