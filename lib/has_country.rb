module HasCountry
  extend ActiveSupport::Concern
  
  module ClassMethods
    def has_country(*args)
      options = args.extract_options!
      code_column = options.delete(:code_column)||:"country_code"
      
      validates_presence_of code_column, options
      
      class_eval <<-EOV
        def country_name
          country.try(:to_s)
        end
  
        def country
          if #{code_column}.present?
            Country[#{code_column}]||Country[#{code_column}.upcase]
          end
        end
      EOV
      
    end
  end
    
end