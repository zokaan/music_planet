class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      log_in @user
      params[:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to songs_path
    else
    render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end
