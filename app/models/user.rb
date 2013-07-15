class User < ActiveRecord::Base
  has_many :posters

  after_create :create_default_page


  private

  def create_default_page
    self.posters.create(:name => 'Starting Page')
  end

end
