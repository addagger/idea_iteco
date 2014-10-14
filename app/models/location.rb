class Location < ActiveRecord::Base
  has_country
  
  has_many :addresses, :dependent => :destroy
  
  scope :city, ->(query) do
    if query.present?
      where("locations.city ~* :query", :query => ".*#{query}.*").references(:locations)
    end
  end
  scope :subdivision, ->(query) do
    if query.present?
      where("locations.subdivision ~* :query", :query => ".*#{query}.*").references(:locations)
    end
  end
  scope :country_code, ->(query) do
    if query.present?
      where("locations.country_code = :query", :query => query).references(:locations)
    end
  end
  
  def to_s
    [city, subdivision, country].select(&:present?).join(", ")
  end
  
end