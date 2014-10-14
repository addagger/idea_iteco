class Address < ActiveRecord::Base
  
  belongs_to :location
  custom_counter_cache_for :location => {:addresses_count => 1, :delivery_points_count => :delivery_points_count, :deliveries_count => :deliveries_count}

  has_many :resource_addresses, :dependent => :destroy  
  
  adaptive_belongs_to :location, :attributes => {:country_code => :country_code, :subdivision => :subdivision, :city => :city},
                      :update_if => Proc.new {|r, owner| r.all_counters_zero_except?(:addresses_count) && r.addresses_count == 1 && r.equal_counters_with?(owner)},
                      :destroy_if => Proc.new {|r| r.all_counters_zero_except?},
                      :uniq_by => [:country_code, :subdivision, :city]
  
  validates_presence_of :country_code, :city, :zip_code, :street
  validates_length_of :street, :minimum => 5, :if => Proc.new {|a| a.street.present?}
  
  delegate :country, :to => :location
  
  scope :city, ->(query) do
    if query.present?
      includes(:location).where("locations.city ~* :query", :query => ".*#{query}.*").references(:locations)
    end
  end
  scope :subdivision, ->(query) do
    if query.present?
      includes(:location).where("locations.subdivision ~* :query", :query => ".*#{query}.*").references(:locations)
    end
  end
  scope :country_code, ->(query) do
    if query.present?
      includes(:location).where("locations.country_code = :query", :query => ".*#{query}.*").references(:locations)
    end
  end
  scope :street, ->(query) do
    if query.present?
      where("addresses.street ~* :query", :query => ".*#{query}.*").references(:addresses)
    end
  end
  scope :zip_code, ->(query) do
    if query.present?
      where("addresses.zip_code ~* :query", :query => ".*#{query}.*").references(:addresses)
    end
  end
  
  def formatted(*args)
    options = args.extract_options!
    if country
      format = country.try(:address_format)||Country["us"].address_format
      recipient = args.first
      chunk_join = options[:chunk_join]||" "
      line_join = options[:line_join]||"\n"
      postalcode = zip_code
      region = location.try(:subdivision)
      format.split("\n").map do |line_address|
        line = line_address.scan(/\w+/).map {|var| eval(var)}.select(&:present?).join(chunk_join)
        line if line.present?
      end.compact.join(line_join)
    end
  end
  
  def to_s(recipient = nil)
    formatted(recipient, :line_join => ", ", :chunk_join => ", ")
  end
  
  def same_as?(other = nil)
    if other
      (location == other.location) && (zip_code == other.zip_code) && (street == other.street)
    else
      false
    end
  end
  
end