module DrinkHelper
  def drink_text(drink)
    DrinkTexter.new(drink).text

  end

  def has_handle(drink)
    drink.coffee? or drink.tea?
  end

  def has_milk(drink)
    drink.coffee? and drink.milk_amount.present? and drink.milk_amount != 'none'
  end

  def has_sugar(drink)
    (drink.coffee? or drink.tea?) and drink.sugar_amount.present? and drink.sugar_amount != 0
  end

  def has_half_sugar(drink)
    return false unless has_sugar(drink)
    drink.sugar_amount / drink.sugar_amount.to_i > 1
  end

  def is_sparkling(drink)
    drink.soda? or (drink.water? and drink.water_type == 'sparkling')
  end

end