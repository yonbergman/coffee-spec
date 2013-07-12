module FormHelper
  def select_options(options)
    options.map do |option|
      [option.to_s.titleize, option]
    end
  end
end