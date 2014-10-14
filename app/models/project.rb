class Project < ActiveRecord::Base
  
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :ideas, :join_table => "projects_ideas"
  
  has_one :html_doc, :as => :resource, :dependent => :destroy
  accepts_nested_attributes_for :html_doc, :allow_destroy => true
  
  has_many :pictures, :as => :resource, :dependent => :destroy
  has_many :uploads, :as => :resource, :dependent => :destroy

  has_one_picture :logo  

  acts_as_taggable
  
  validates_presence_of :title
  
  with_permalink :permalink, :from => Proc.new {|project| project.title.to_permalink}
  
  default_scope { order("position") }
  scope :published, -> { where(:published => true) }
  scope :recent, -> { order("updated_at DESC").limit(6) }
  
  after_initialize do
    build_html_doc unless html_doc
    self.date_started = Date.today unless self.date_started
  end
  
  def to_s
    title
  end
  
  def to_param
    permalink
  end
  
end
