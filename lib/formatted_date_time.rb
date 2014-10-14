module FormattedDateTime
  extend ActiveSupport::Concern
  
  module ClassMethods
      
    def formatted_date_accessor(*names)
      names.each do |name|
        validate do
          if @invalid_dates.is_a?(Hash)
            @invalid_dates.each do |name, value|
              errors.add(name.to_sym, "'#{value}' can't be formatted to date")
            end
          end
        end
        
        define_method("#{name}=") do |value|
          begin
            super(Date.parse(value)) if value.present?
          rescue
            define_singleton_method name.to_sym do
              value
            end
            (@invalid_dates ||= {})[name] = value
          end
        end
      end
    end
    
  end
  
end