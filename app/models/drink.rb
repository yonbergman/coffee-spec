class Drink < ActiveRecord::Base
  include EnumAccessor

  belongs_to :poster
  has_one :user, :through => :poster

  enum :kind, [:coffee, :iced_coffee, :espresso, :turkish, :tea, :water, :soda]
  enum_accessor :milk_amount, [:none, :a_bit, :a_third, :a_lot]
  enum_accessor :milk_type, [:regular, :slim, :soy]
  enum_accessor :sugar_amount, [0, 0.5, 1, 1.5, 2, 2.5]
  enum_accessor :sugar_type, [:regular, :brown, :artificial_sweetener]
  enum_accessor :strength, [:normal, :light, :strong, :decaf]
  enum_accessor :tea_type, [:earl_grey, :green, :herbal]
  enum_accessor :water_type, [:still, :sparkling]
  enum_accessor :soda_type, [:coke, :diet_coke, :coke_zero, :sprite, :fanta]
  enum_accessor :size, [:single, :double]
  enum_accessor :pod, [:any, :kazaar, :dharkan, :ristretto, :arpeggio, :roma, :livanto, :capriccio, :volluto, :cosi, :indriya, :rosabaya, :dulsao, :fortissio, :vivalto, :linizio]

  TYPES = {
      :coffee => [:strength, :milk_amount, :milk_type, :sugar_amount, :sugar_type],
      :iced_coffee => [:strength, :milk_amount, :milk_type, :sugar_amount, :sugar_type],
      :espresso => [:size, :pod, :milk_amount, :milk_type, :sugar_amount, :sugar_type],
      :turkish => [:strength, :sugar_amount, :sugar_type],
      :tea => [:tea_type, :sugar_amount, :sugar_type],
      :water => [:water_type],
      :soda => [:soda_type],
  }

  scope :ordered, lambda { order(:id) }
  scope :latest, lambda {|n| order(:id => :desc).limit(n)}

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
    return nil if s.blank?
    if s.to_i == s.to_f
      s.to_i
    else
      s.to_f
    end
  end

  def sugar_amount=(val)
    return super(nil) if val.blank?
    super(val.to_f)
  end

  def possible_drink_attributes
    TYPES[kind]
  end

  private


  def defaults
    self.kind ||= :coffee
    if poster.drinks.empty?
      self.name ||= user.name
    end
  end

end
