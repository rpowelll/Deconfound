class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to login_url, :alert => "You need to log in to do that"
  end
end
