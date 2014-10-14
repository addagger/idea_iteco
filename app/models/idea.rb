class Idea < ActiveRecord::Base
  
  attr_accessor :person_name, :person_email, :person_phone_code, :person_phone_number
  attr_reader :temp_person
  
  belongs_to :person
  validates_length_of :details, in: 30..1.megabyte
  
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :projects, :join_table => "projects_ideas"
  
  acts_as_taggable
  
  validates_presence_of :title, :details

  before_validation do
    @temp_person = Person.recognize_or_new(:name => person_name, :email => person_email, :phone_code => person_phone_code, :phone_number => person_phone_number)
  end
  
  valid_with :temp_person, :attributes => {:name => :person_name, :emails => :person_email, :phones => :person_phone_number }, :errors => :fit
  
  before_save do
    if @temp_person.try(:valid?)
      @temp_person.save
      self.person = @temp_person
    end
  end
  
  before_create do
    generate_token!
    self.number = (Idea.maximum(:number)||0) + 1
  end
  
  def to_s
    title
  end
  
  def to_param
    token
  end
  
  def approve!
    self.approved = true
    save
  end
  
  def person_name
    @person_name||person.try(:name)
  end
  
  def person_email
    @person_email||person.try(:email)
  end
  
  def person_phone_code
    @person_phone_code||person.try(:phone_code)
  end
  
  def person_phone_number
    @person_phone_number||person.try(:phone_number)
  end
  
  protected
  
  def generate_token!
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Idea.exists?(token: random_token)
    end
  end
  
end
