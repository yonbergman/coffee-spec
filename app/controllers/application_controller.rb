class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include UserSupport

  def root
    if user_signed_in?
      redirect_to :posters
    else
      render :about
    end
  end

  def about
  end

end
