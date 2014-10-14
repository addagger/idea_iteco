class Person < ActiveRecord::Base
  
  formatted_date_accessor :birthdate
  
  belongs_to :user
  
  has_many :resource_addresses, -> { order("resource_addresses.created_at DESC") }, :as => :resource, :dependent => :delete_all
  has_many :resource_phones, -> { order("resource_phones.created_at DESC") }, :as => :resource, :dependent => :delete_all
  has_many :resource_emails, -> { order("resource_emails.created_at DESC") }, :as => :resource, :dependent => :delete_all
  has_many :resource_websites, -> { order("resource_websites.created_at DESC") }, :as => :resource, :dependent => :delete_all
  accepts_nested_attributes_for :resource_addresses, :resource_phones, :resource_emails, :resource_websites, :allow_destroy => true
  
  has_many :addresses, :through => :resource_addresses, :source => :address
  has_many :phones, :through => :resource_phones, :source => :phone
  has_many :emails, :through => :resource_emails, :source => :email
  has_many :websites, :through => :resource_websites, :source => :website

  has_many :ideas, :dependent => :nullify
  has_many :messages, :dependent => :nullify

  validates_presence_of :name#, :birthdate
  
  escape_blank :first_name, :last_name
  
  before_validation do
    self.name = to_s unless self.name.present?
  end
  
  scope :phone, ->(code, number) do
    if code.present? && number.present?
      includes(:resource_phones => :phone).where("phones.country_code = :country_code AND phones.number = :number", :country_code => code, :number => number).references(:phones)
    end
  end
  
  scope :email, ->(address) do
    if address.present?
      includes(:resource_emails => :email).where("emails.address = :address", :address => address).references(:emails)
    end
  end
  
  scope :website, ->(address) do
    if address.present?
      includes(:resource_websites => :website).where("websites.address = :address", :address => address).references(:websites)
    end
  end
  
  def self.recognize(attributes = {})
    person_where_values =
    if attributes[:name].blank?
      nil
    elsif attributes[:name].split.size == 1
      ["people.name = :name", :name => attributes[:name]]
    elsif attributes[:name]
      part_1 = attributes[:name].split[0]
      part_2 = attributes[:name].split[1..-1].join(" ")
      ["people.name = :name OR (people.first_name = :part_1 AND people.last_name = :part_2) OR (people.first_name = :part_2 AND people.last_name = :part_1)", :name => attributes[:name], :part_1 => part_1, :part_2 => part_2]
    end
    if attributes[:email].present?
      email(attributes[:email]).where(person_where_values)
    elsif attributes[:phone_number].present? && attributes[:phone_code].present?
      number = Country[attributes[:phone_code]].country_code + attributes[:phone_number]
      phone(attributes[:phone_code], number).where(person_where_values)
    elsif attributes[:website].present?
      website(attributes[:website]).where(person_where_values)
    end
  end
  
  def self.recognize_or_new(attributes = {})
    if attributes[:name].present? && (attributes[:email].present? || (attributes[:phone_number].present? && attributes[:phone_code].present?))
      recognize(attributes).limit(1).first
    end||new(attributes)
  end
  
  def email
    emails.last.try(:address)
  end
  
  def phone_code=(value)
    phone.country_code = value if value.present?
  end
  
  def phone_number=(value)
    phone.number = value if value.present?
  end
  
  def phone
    @phone ||= phones.last||phones.build
  end
  
  def email=(value)
    emails.find_by(:address => value)||emails.build(:address => value)
  end
  
  def first_name=(value)
    super(value.mb_chars.capitalize.to_s)
  end
  
  def last_name=(value)
    super(value.mb_chars.capitalize.to_s)
  end
  
  def to_s
    [first_name, last_name].compact.join(" ")
  end
  
  # def subscriptions
  #   Subscription.includes(:email).where(:emails => {:address => emails.map(&:address).uniq})
  # end
  
end
