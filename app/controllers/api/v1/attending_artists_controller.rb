class AttendingArtistsController < ApplicationController

  def index
    @artists = AttendingArtist.all
  end

  def show
  end

  def create
  end

  private

end
