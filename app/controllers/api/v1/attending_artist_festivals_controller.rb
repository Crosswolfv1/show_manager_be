class Api::V1::AttendingArtistFestivalsController < ApplicationController
  rescue_from ArgumentError, with: :invalid_parameters

  def delete
    entry = AttendingArtistFestival.find_by(
      festival_id: params[:festival_id], 
      attending_artist_id: params[:artist_id]
    )
    AttendingArtistFestival.delete(entry.id)
  end

  private
  
  def invalid_parameters(exception)
    render json: ErrorSerializer.format_error(ErrorMessage.new(exception, 404)), status: :not_found
  end
end
