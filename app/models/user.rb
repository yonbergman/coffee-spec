class User < ActiveRecord::Base
  has_many :pages

  after_create :create_default_page


  private

  def create_default_page
    self.pages.create(:name => 'Starting Page')
  end

end
