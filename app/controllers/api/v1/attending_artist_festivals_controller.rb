class Api::V1::AttendingArtistFestivalsController < ApplicationController
  rescue_from ArgumentError, with: :invalid_parameters

  def delete
    entry = AttendingArtistFestival.find(festival_id: Festival.find(params(:festival_id)).id, attending_artist_id: AttendingArtist.find(params(:artist_id)).id)
  end



  private
  
  def invalid_parameters(exception)
    render json: ErrorSerializer.format_error(ErrorMessage.new(exception, 404)), status: :not_found
  end
end
