class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update]

  def index
    @artists = Artist.all
  end

  def show
    @songs = @artist.songs
  end

  def new
    @artist = Artist.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params
      .require(:artist)
      .permit(:name)
  end
end
