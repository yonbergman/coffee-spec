class Drink < ActiveRecord::Base
  include EnumAccessor

  belongs_to :page
  has_one :user, :through => :page

  enum :kind, [:coffee, :tea, :water]
  enum_accessor :milk_amount, [:a_bit, :a_third, :a_lot]
  enum_accessor :milk_type, [:regular, :slim, :soy]
  enum_accessor :sugar_amount, [0.5, 1, 1.5, 2, 2.5]
  enum_accessor :sugar_type, [:regular, :brown, :artificial_sweetner]
  enum_accessor :strength, [:normal, :light, :strong]
  enum_accessor :tea_type, [:earl_grey, :green, :herbal]


  TYPES = {
      :coffee => [:milk_amount, :milk_type, :sugar_amount, :sugar_type, :strength],
      :tea => [:sugar_amount, :sugar_type, :tea_type],
      :water => [],
  }

  scope :ordered, lambda { order(:id) }

  after_initialize :defaults

  validates_presence_of :name

  def kind=(val)
    super(val)
    reset_attributes(Drink.stored_attributes[:drink_attributes] - TYPES[val.to_sym])
  end

  def reset_attributes(attributes)
    Rails.logger.info "RESET ATTRIBUTES #{attributes.inspect}"
    #self.update!(Hash[attributes.collect{|x| [x, nil]}])
  end

  def sugar_amount
    s = super()
    if s.to_i == s.to_f
      s.to_i
    else
      s.to_f
    end
  end

  def sugar_amount=(val)
    super(nil) if val.nil?
    super(val.to_f)
  end

  private


  def defaults
    self.kind ||= :coffee
    if page.drinks.empty?
      self.name ||= user.name
    end
  end

end
