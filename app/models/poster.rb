class Poster < ActiveRecord::Base
  TOKEN_LENGTH = 8

  belongs_to :user
  has_many :drinks

  after_initialize :defaults

  validates_presence_of :name


  def to_param
    self.token
  end

  private

  def defaults
    self.name   ||= I18n.translate('drinks.default_name')
    self.token  ||= SecureRandom.urlsafe_base64(TOKEN_LENGTH)
  end

end
