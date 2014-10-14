class Picas < ActiveRecord::Base
  
  belongs_to :resource, :polymorphic => true
  belongs_to :picture, :counter_cache => :used_count
  
  validates_presence_of :resource, :picture
    
  def picture?
    picture||Picture.new
  end
  
end