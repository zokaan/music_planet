class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize
    redirect_to new_session_path unless current_user
  end

  include SessionsHelper
end
