module UserSupport
  extend ControllerSupport::Base

  helper_method :current_user, :user_signed_in?

  def current_user
    @user ||= load_user
  end

  def user_signed_in?
    current_user.present?
  end

  def must_be_signed_in
    redirect_to '/500' unless user_signed_in?
  end

  def sign_in(user)
    session[:provider] = user.provider
    session[:uuid] = user.uuid
  end

  def sign_out
    session[:provider] = nil
    session[:uuid] = nil
  end

  private

  def load_user
    return nil if session[:uuid].blank?
    User.where(:provider => session[:provider], :uuid => session[:uuid]).first
  end
end
