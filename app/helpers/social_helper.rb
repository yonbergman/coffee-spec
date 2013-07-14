module SocialHelper
  def share_url
    "https://www.facebook.com/sharer/sharer.php?u=#{CGI.escape(page_url(@page, share: 'fb'))}"
  end
end