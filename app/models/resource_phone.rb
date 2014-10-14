class ResourcePhone < ActiveRecord::Base
  model_name.instance_variable_set(:@i18n_key, 'phone')
  
  belongs_to :resource, :polymorphic => true
  belongs_to :phone
  
  adaptive_belongs_to :phone, :attributes => {:country_code => :country_code, :number => :number, :fax => :fax},
                      :update_if => Proc.new {|r, owner| r.all_counters_zero_except?(:resources_count) && r.resources_count == 1 && r.equal_counters_with?(owner)},
                      :destroy_if => Proc.new {|r| r.all_counters_zero_except?},
                      :uniq_by => [:country_code, :number, :fax]
  
  validates_uniqueness_of :phone_id, :scope => [:resource_type, :resource_id]
  
  delegate :to_s, :same_as?, :to => :phone
  
end