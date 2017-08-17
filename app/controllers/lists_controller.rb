class ListsController < ApplicationController

  def new
    # @lists = current_user.try(:playlist) || Playlist.all
    @lists = current_user.playlists
    @list.song_id = params[:song_id]

    respond_to do |format|
      # if current_user.playlists.present?
        format.js
        format.html { redirect_to(new_playlist_path, :notice => 'First you must create playlist') }
    end
  end

  def create
     @list = current_user.list.build
     @list.set_user!(current_user)

     if @list.save
       flash[:notice] = 'Song is successfully added to your playlist!'
       redirect_to songs_path
     else
       render :new
     end
  end




  private

  def list_params
    params.require(:list).permit(:song_id, :playlist_id)
  end

end
