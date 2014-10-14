class ResourceAddress < ActiveRecord::Base
  model_name.instance_variable_set(:@i18n_key, 'address')
  
  belongs_to :resource, :polymorphic => true
  belongs_to :address
  
  adaptive_belongs_to :address, :attributes => {:country_code => :country_code, :subdivision => :subdivision, :city => :city, :zip_code => :zip_code, :street => :street},
                      :update_if => Proc.new {|r, owner| r.all_counters_zero_except?(:resources_count) && r.resources_count == 1 && r.equal_counters_with?(owner)},
                      :destroy_if => Proc.new {|r| r.all_counters_zero_except?},
                      :uniq_by => [:country_code, :subdivision, :city, :zip_code, :street]
  
  validates_uniqueness_of :address_id, :scope => [:resource_type, :resource_id]
  
  delegate :to_s, :formatted, :same_as?, :to => :address
  
end