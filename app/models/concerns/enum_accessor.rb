module EnumAccessor
  extend ActiveSupport::Concern

  module ClassMethods
    def enum_accessor(key, options, attributes = :drink_attributes)
      sym_key = key.to_sym
      store_accessor attributes, sym_key
      if options.first.class == Symbol
        processed_optoins = options.map(&:to_s)
      else
        processed_optoins = options
      end
      const_set("#{key.to_s.pluralize.upcase}", processed_optoins)
      validates_inclusion_of sym_key, :in => processed_optoins, :allow_nil => true, :allow_blank => true
    end
  end
end