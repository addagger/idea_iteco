class HtmlDoc < ActiveRecord::Base
  
  belongs_to :resource, :polymorphic => true
  
  validates_presence_of :content
  
  escape_blank_html  :content
  
  def to_s
    content
  end
  
end
