class Message < ActiveRecord::Base
  attr_accessor :person_name, :person_email, :person_phone_code, :person_phone_number
  attr_reader :temp_person
  
  belongs_to :person
  
  validates_presence_of :content
  validates_length_of :content, in: 20..400
  
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
  
  def to_s
    message
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
  
end
