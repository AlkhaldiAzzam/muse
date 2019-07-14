class SongsController < ApplicationController

def new
    @artist = Artist.find(params[:artist_id]) # it will go to the artist it self...
    @song = Song.new
end

def create #Creates a new song...
    puts params
    artist = Artist.find(params[:song][:artist_id]) 
    Song.create(params.require(:song).permit(:title, :genre, :artist_id)) #We need the artist id to use it in the creation.
           #You can do it also by: "artist.songs.create(params.require(:song).permit(:title, :genre))"
    redirect_to artist
  end

end
