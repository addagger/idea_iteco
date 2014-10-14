class Category < ActiveRecord::Base
  
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :ideas, :join_table => "categories_ideas"
    
  has_one :html_doc, :as => :resource, :dependent => :destroy
  accepts_nested_attributes_for :html_doc, :allow_destroy => true
  
  has_many :pictures, :as => :resource, :dependent => :destroy
  has_many :uploads, :as => :resource, :dependent => :destroy
  
  validates_presence_of :title
  
  with_permalink :permalink, :from => Proc.new {|category| category.title.to_permalink}
  
  escape_blank :description, :icon
  
  default_scope { order("position") }
  scope :published, -> { where(:published => true) }
  
  after_initialize do
    build_html_doc unless html_doc
  end
  
  def ready?
    projects.present?
  end
  
  def to_s
    title
  end
  
  def to_param
    permalink
  end
  
end
