class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
  @playlist = Playlist.new
  end

def create
  @playlist = Playlist.new(playlist_params)

  if @playlist.save
    flash[:notice] = 'Playlist successfully added!'
    redirect_to playlists_path
  else
    render :new
  end
end

def destroy
    @playlist = Playlist.find(params[:id])
    if @playlist.present?
      @playlist.destroy
    end
    redirect_to playlists_path
end

private

def playlist_params
  params.require(:playlist).permit(:playlist_name, :user_id)
end
end
