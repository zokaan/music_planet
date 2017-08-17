class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize
    redirect_to new_session_path unless current_user
  end

  def authorize_for_admins
    unless current_user.admin?
      flash[:notice] = 'Unauthorized access!'
      redirect_to root_path
    end
  end

  def authorize_for_superadmins
    unless current_user.superadmin?
      flash[:notice] = 'Unauthorized access!'
      redirect_to root_path
    end
  end

  include SessionsHelper
end
