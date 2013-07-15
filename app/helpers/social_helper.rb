module SocialHelper
  def share_url
    "https://www.facebook.com/sharer/sharer.php?u=#{CGI.escape(poster_url(@poster, share: 'fb'))}"
  end
end