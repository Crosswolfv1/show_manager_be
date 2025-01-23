class Api::V1::AttendingArtistFestivalsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_parameters
  rescue_from ArgumentError, with: :invalid_parameters

  def delete
    validate_params
    entry = AttendingArtistFestival.find_by(
      festival_id: params[:festival_id], 
      attending_artist_id: params[:artist_id]
    )
    raise ArgumentError, "Artist not found at this festival" unless entry
    AttendingArtistFestival.delete(entry.id)
    render json: { message: "Artist successfully removed from festival" }, status: :accepted
  end

  private
  
  def validate_params
    Festival.find(params[:festival_id]) 
    AttendingArtist.find(params[:artist_id]) 
  end

  def invalid_parameters(exception)
    render json: ErrorSerializer.format_error(exception, 404), status: :not_found
  end
end
