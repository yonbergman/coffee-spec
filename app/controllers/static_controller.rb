class StaticController < ApplicationController

  def not_found
    error(404)
  end

  def internal_error
    error(500)
  end

  def no_permission
    error(403)
  end


  private

  def error(code)
    render 'static/error', :locals => {:code => code}
  end

end