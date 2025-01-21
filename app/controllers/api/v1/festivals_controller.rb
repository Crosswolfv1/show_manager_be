class Api::V1::FestivalsController < ApplicationController
  rescue_from ArgumentError, with: :invalid_parameters

  def index
    festivals = Festival.all
    options = {}
    options[:meta] = {total: festivals.count}
    render json: FestivalSerializer.new(festivals, options)
  end

  def show
    festival = Festival.find_by(id: params[:id])
    render json: FestivalSerializer.new(festival)
  end

  def create
  end



  private

  def invalid_parameters(exception)
    render json: ErrorSerializer.format_error(ErrorMessage.new(exception, 404)), status: :not_found
  end
end
