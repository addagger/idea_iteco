class Tagging < ActiveRecord::Base
  
  belongs_to :tag, :counter_cache => true  
  belongs_to :resource, :polymorphic => true
  
  after_destroy do
    tag = Tag.find(tag_id)
    tag.destroy if tag.all_counters_zero_except?
  end
  
end
