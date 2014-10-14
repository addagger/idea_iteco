require 'locale_support/ru'

module LocaleSupport
  
  def self.multi(hash)
    new_hash = {}
    hash.each do |key, value|
      if key.is_a?(Array)
        key.each do |k|
          new_hash[k] = value.is_a?(Hash) ? multi(value) : value
        end
      else
        new_hash[key] = value.is_a?(Hash) ? multi(value) : value
      end
    end
    new_hash
  end
  
end