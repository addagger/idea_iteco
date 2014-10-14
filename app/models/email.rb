class Email < ActiveRecord::Base
  FORMAT_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  has_many :resource_emails, :dependent => :destroy  
  # has_many :subscriptions, :dependent => :destroy
  
  validates_presence_of :address
  validates_format_of :address, :with => FORMAT_REGEXP, :if => ->(email) { email.address.present? }
  
  scope :query, ->(query) do
    if query.present?
      where("emails.address ~* :query", :query => ".*#{query}.*").references(:emails)
    end
  end
  
  def to_s
    address
  end
  
  def same_as?(other = nil)
    if other
      address == other.address
    else
      false
    end
  end
end
