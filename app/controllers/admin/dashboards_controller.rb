class Admin::DashboardsController < Admin::BaseController

  def show
    @users = User.all
    @songs = Song.all
    @albums = Album.all
  end

end
