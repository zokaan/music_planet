class AlbumsController < ApplicationController
  before_action :authorize
  
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

  def show
  end

  def destroy
      @album = Album.find(params[:id])
      if @album.present?
        @album.destroy
      end
      redirect_to albums_path
  end


  private

  def album_params
    params.require(:album).permit(:album_name, :publisher, :made_in, :description, :user_id);
end

end
