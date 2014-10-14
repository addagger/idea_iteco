class Phone < ActiveRecord::Base
  has_country

  phony_normalize :number
  
  has_many :resource_phones, :dependent => :destroy  
  
  validates_presence_of :number
  validates_plausible_phone :number, :if => ->(phone) { phone.number.present? }
  
  scope :query, ->(query) do
    if query.present?
      where("phones.number ~* :query", :query => Phone.number_without_code(query)).references(:phones)
    end
  end
  
  def self.number_without_code(number)
    if number
      if number[0] == "+"
        number[2..-1]
      else
        number[1..-1]
      end
    end
  end
  
  def to_s
    number.phony_formatted(:format => :international, :spaces => '-', :normalize => country_code)
  end
  
  def same_as?(other = nil)
    if other
      (country_code == other.country_code) && (number == other.number)
    else
      false
    end
  end
end
