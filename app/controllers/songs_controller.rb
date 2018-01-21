class SongsController < ApplicationController
  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to artist_path(@artist), notice: "Song successfully removed"
  end
end
