module DrinkHelper
  def drink_text(drink)
    "A #{drink.kind}"
  end

  def has_handle(drink)
    drink.coffee? or drink.tea?
  end

  def has_milk(drink)
    drink.milk_amount.present?
  end

  def has_sugar(drink)
    drink.sugar_amount > 0
  end

  def has_half_sugar(drink)
    drink.sugar_amount / drink.sugar_amount.to_i > 1
  end
end