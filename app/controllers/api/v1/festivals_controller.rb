class Api::V1::FestivalsController < ApplicationController
  rescue_from ArgumentError, with: :invalid_parameters

  def index
    festivals = Festival.includes(:attending_artists)
    options = {}
    options[:meta] = {total: festivals.count}
    options[:include] = [:attending_artists, :users]
    render json: FestivalSerializer.new(festivals, options)
  end
  
  def show
    festival = Festival.find_by(id: params[:id])
    raise ArgumentError, "Festival not found" unless festival
    options = {}
    options[:include] = [:attending_artists, :users]
    render json: FestivalSerializer.new(festival, options)
  end

  private

  def invalid_parameters(exception)
    render json: ErrorSerializer.format_error(exception, 404), status: :not_found
  end
end
