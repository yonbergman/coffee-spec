module DrinkHelper
  def drink_text(drink)
    DrinkTexter.new(drink).text

  end

  def is_iced(drink)
    drink.iced_coffee?
  end

  def has_handle(drink)
    drink.coffee? or drink.tea? or drink.espresso?
  end

  def has_milk(drink)
    drink.possible_drink_attributes.include?(:milk_amount) and drink.milk_amount.present? and drink.milk_amount != 'none'
  end

  def has_sugar(drink)
    drink.possible_drink_attributes.include?(:sugar_amount) and drink.sugar_amount.present? and drink.sugar_amount != 0
  end

  def has_half_sugar(drink)
    return false unless has_sugar(drink)
    drink.sugar_amount / drink.sugar_amount.to_i > 1
  end

  def is_sparkling(drink)
    drink.soda? or (drink.water? and drink.water_type == 'sparkling')
  end

  def small_glass(drink)
    drink.espresso? ? 'small' : ''
  end

  def has_pod(drink)
    drink.espresso? and drink.pod != 'any'
  end

  ####

  def short_name(drink)
    if drink.name.length < 10
      return {:class => 'short'}
    end
    {}
  end

  def iced(drink)
    is_iced(drink) ? 'iced' : ''
  end

end