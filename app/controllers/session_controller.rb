class SessionController < ApplicationController

  skip_before_filter :verify_authenticity_token


  def create
    user = user_from_auth_hash
    if user.valid?
      sign_in(user)
      redirect_to posters_path
    else
      redirect_to :root, :error => 'Could not sign in'
    end
  end


  def failure
    redirect_to :root, :error => 'Could not sign in'
  end

  def destroy
    sign_out
    redirect_to :root
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_from_auth_hash
    info = ActionController::Parameters.new(auth_hash[:info]).permit(:email, :name)
    user = User.where(:provider => auth_hash[:provider], :uuid => auth_hash[:uid]).first_or_create(info)
  end

end