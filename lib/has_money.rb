module HasMoney
  extend ActiveSupport::Concern
  
  module ClassMethods
    def has_money(*args)
      options = args.extract_options!
      args.each do |name|
        amount_field = :"#{name}_amount"
        currency_field = :"#{name}_currency"
              
        validates_inclusion_of currency_field, :in => Money.currency_iso_codes, :if => Proc.new {|o| o.send(currency_field).present?}
        validates_presence_of amount_field, :if => Proc.new {|o| o.send(currency_field).present?}
        validates_presence_of currency_field, :if => Proc.new {|o| o.send(amount_field).present?}
        validates_numericality_of name, :greater_than_or_equal_to => 0, :if => Proc.new {|o| o.send(name).present?}
      
        class_eval <<-EOV      
          after_initialize do
            @attributes["#{name}"] = @#{name}
          end
          
          def #{name}
            begin
              Money.new(#{amount_field}, #{currency_field})
            rescue ArgumentError, TypeError
              nil
            end
          end

          def #{name}=(value)
            money = case value
            when Money then
              value
            when Hash then
              value = value.with_indifferent_access
              Monetize.parse(value[:amount], value[:currency])
            when Array then
              Monetize.parse(*value)
            else
              Monetize.parse(value)
            end
            self.#{amount_field} = money.fractional
            self.#{currency_field} = money.currency.iso_code
            money
          end
        
        EOV
      end
    end
  end
    
end