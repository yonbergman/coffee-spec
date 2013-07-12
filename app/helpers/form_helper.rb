module FormHelper

  def drink_options(field)
    "Drink::#{field.to_s.pluralize.upcase}".constantize
  end

  def select_options(options)
    options.map do |option|
      [option.to_s.titleize, option]
    end
  end
end