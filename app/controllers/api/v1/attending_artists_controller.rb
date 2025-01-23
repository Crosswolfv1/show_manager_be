class Api::V1::AttendingArtistsController < ApplicationController
  rescue_from ArgumentError, with: :invalid_parameters

  def index
    @artists = AttendingArtist.all
  end

  private

  def invalid_parameters(exception)
    render json: ErrorSerializer.format_error(ErrorMessage.new(exception, 404)), status: :not_found
  end
end
