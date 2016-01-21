class DrinkTexter
  attr_accessor :drink

  def initialize(drink)
    @drink = drink
  end

  def text
    case(drink.kind)
      when :coffee then coffee_text
      when :iced_coffee then iced_coffee_text
      when :espresso then espresso_text
      when :turkish then turkish_text
      when :tea then tea_text
      when :water then water_text
      when :soda then soda_text
      else "A #{drink.kind}"
    end
  end

  private

  def coffee_text
    t = ''
    t += drink.strength.titleize unless drink.strength.nil? or drink.strength == 'normal'
    t += ' Coffee'
    t += milk_text
    t += sugar_text
  end

  def iced_coffee_text
    t = ''
    t += drink.strength.titleize unless drink.strength.nil? or drink.strength == 'normal'
    t += ' Iced Coffee'
    t += milk_text
    t += sugar_text
  end

  def espresso_text
    t = ''
    t += 'Double' if drink.size == 'double'
    t += drink.length.titleize unless drink.length.nil? or drink.length == 'normal'
    t += ' Espresso'
    t += " (#{drink.pod.titleize}) " unless drink.pod.nil? or drink.pod == 'any'
    milk = milk_text
    t += milk unless milk == ', No Milk'
    t += sugar_text
    t.strip
  end

  def turkish_text
    t = ''
    t += 'Turkish Coffee'
    t += drink.strength.titleize unless drink.strength.nil? or drink.strength == 'normal'
    t += sugar_text
  end

  def tea_text
    t = drink.tea_type.titleize
    t += ' Tea'
    t += sugar_text
  end

  def water_text
    case drink.water_type
      when 'sparkling' then 'Sparkling Water'
      else 'Water'
    end
  end

  def soda_text
    "A #{drink.soda_type.to_s.titleize}"
  end

  def milk_text
    return '' unless drink.milk_amount.present?
    t = ', '
    if drink.milk_amount == 'none'
      t += 'No Milk'
    else
      t += "#{drink.milk_amount.titleize} of "
      t += "#{drink.milk_type.titleize} " unless drink.milk_type == 'regular'
      t += 'Milk'
    end
    t
  end

  def sugar_text
    return '' unless drink.sugar_amount.present?
    t = ', '
    if drink.sugar_amount == 0
      t += 'No Sugar'
    else
      t += "#{drink.sugar_amount} "
      t += case drink.sugar_type
        when 'regular' then 'Sugar'
        when 'brown' then 'Brown Sugar'
        when 'artificial_sweetener', 'artificial_sweetner' then 'Artificial Sweetner'
      end
    end
    t
  end

end
