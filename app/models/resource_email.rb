class ResourceEmail < ActiveRecord::Base
  model_name.instance_variable_set(:@i18n_key, 'email')
  
  belongs_to :resource, :polymorphic => true
  belongs_to :email
  
  adaptive_belongs_to :email, :attributes => {:address => :address},
                      :update_if => Proc.new {|r, owner| r.all_counters_zero_except?(:resources_count) && r.resources_count == 1 && r.equal_counters_with?(owner)},
                      :destroy_if => Proc.new {|r| r.all_counters_zero_except?},
                      :uniq_by => [:address]
  
  validates_uniqueness_of :email_id, :scope => [:resource_type, :resource_id]
  
  delegate :to_s, :same_as?, :to => :email
  
end