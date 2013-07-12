class Drink < ActiveRecord::Base
  belongs_to :page
  has_one :user, :through => :page

  enum :kind, [:coffee, :tea]

  after_initialize :defaults

  validates_presence_of :name

  private


  def defaults
    self.kind ||= :coffee
    if page.drinks.empty?
      self.name ||= user.name
    end
  end

end
