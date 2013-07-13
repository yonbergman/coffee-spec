module PagesSupport
  extend ControllerSupport::Base

  helper_method :current_page, :page_owner?

  def current_page
    @page ||= load_page
  end

  def preload_page
    redirect_to '/404' unless current_page.present?
  end

  def page_owner?
    user_signed_in? and current_user == current_page.user
  end

  def must_be_page_owner
    redirect_to '/404' unless page_owner?
  end

  private

  def load_page
    Page.where(:token => (params[:page_id] || params[:id])).first
  end

end