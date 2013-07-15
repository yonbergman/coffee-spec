module PostersSupport
  extend ControllerSupport::Base

  helper_method :current_poster, :poster_owner?

  def current_poster
    @poster ||= load_poster
  end

  def preload_poster
    redirect_to '/404' unless current_poster.present?
  end

  def poster_owner?
    user_signed_in? and current_user == current_poster.user
  end

  def must_be_poster_owner
    redirect_to '/404' unless poster_owner?
  end

  private

  def load_poster
    Poster.where(:token => (params[:poster_id] || params[:id])).first
  end

end