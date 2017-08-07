class SongsController < ApplicationController

  def index
    if params[:search]
      @songs = Song.search(params[:search]).order("created_at DESC").page(params[:page]).per_page(10)
    else
      @songs = Song.order("created_at DESC").page(params[:page]).per_page(10)
    end
    # @songs = Song.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
    @favorite_songs = Song.last_added_first.limit(5)
    @top_albums = Album.last_added_first.limit(5)
  end

  def new
  @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = 'Song successfully added!'
      redirect_to songs_path
    else
      render :new
    end
  end


  def destroy
      @song = Song.find(params[:id])
      if @song.present?
        @song.destroy
      end
      redirect_to songs_path
  end

  def search
  if params[:search].present?
    @songs = Song.search(params[:search])
  end
end

  private

  def song_params
    params.require(:song).permit(:song_name, :artist, :genre, :favorites, :year_of_publishing, :duration, :youtube_link, :album_id, :user_id)
  end

end
