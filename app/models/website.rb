class Website < ActiveRecord::Base

  has_many :resource_websites, :dependent => :destroy
  
  validates_presence_of :address
  
  scope :query, ->(query) do
    if query.present?
      where("websites.address ~* :query", :query => ".*#{query}.*").references(:websites)
    end
  end
  
  def address=(value)
    addressable = Addressable::URI.parse(value)
    super("#{addressable.host}#{addressable.path}")
  end
  
  def to_s
    url
  end
  
  def same_as?(other = nil)
    if other
      address == other.address
    else
      false
    end
  end
  
  def url
    "http://#{address}"
  end
end
