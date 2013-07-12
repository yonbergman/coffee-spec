class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include UserSupport

  def root
    if user_signed_in?
      if current_user.pages.count == 1
        redirect_to page_path(current_user.pages.first)
      else
        redirect_to pages_path
      end

    end
  end

end
