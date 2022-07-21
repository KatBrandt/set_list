class SongsController < ApplicationController
  def index
    @songs = Song.all
    @cart = Cart.new(session[:cart])
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    artist = Artist.find(params[:artist_id])
    song = artist.songs.create!(song_params)

    redirect_to song_path(song)
  end

  private
  def song_params
    params.require(:song).permit(:title, :length, :play_count)
  end
end
