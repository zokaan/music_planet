class AlbumsController < ApplicationController
  before_action :authorize
  before_action :find_album, { only: [:edit, :update, :show, :destroy] }

  def index
    @albums = Album.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      flash[:notice] = 'Album added successfully :)'
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  if @album.update(album_params)
    redirect_to albums_path
  else
    render :edit
  end
end

  def destroy
      if @album.present?
        @album.destroy
      end
      redirect_to albums_path
  end


  private

  def album_params
    params.require(:album).permit(:album_name, :publisher, :made_in, :description, :user_id, :image);
  end

def find_album
  @album = Album.find(params[:id])
end

end
