class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
        @name = "Azzam"
    end

    def show
        puts params  #to check the parametrs. You can find it in the server terminal.(You will find it above 'Artist Load (8.2ms)  SELECT  "artists".*.....' , its in blue)
        @artist = Artist.find(params[:id]) #'params[:id]' will get the id of the artist that has been pressed
        @songs = @artist.songs #we dont actually need this, we can use '@artists.songs' anyway.
    end

    def new
        @artist = Artist.new
    end

    def create
        puts params
        # Artist.create(params.require(:artist).permit(:name, :albums, :hometown, :img)) # most of it are security things...
        Artist.create(artists_params) 
        redirect_to artists_path

    end

    def edit
        puts params
        @artist = Artist.find(params[:id]) # Same as the ones before.
    end

    def update

        artist = Artist.find(params[:id])
        # artist.update(params.require(:artist).permit(:name, :albums, :hometown, :img)) #You can do this all in one line...
       artist.update(artists_params) 
        redirect_to artist  #will redirect the page to the artist page..
    end

    def destroy #This will activate the 'delete' button.

        Artist.find(params[:id]).destroy

        redirect_to artists_path

    end
    
    private 

    def artists_params #This is a shortcut for the line, we will only use this method instead. And its private

        params.require(:artist).permit(:name, :albums, :hometown, :img)

    end


end
