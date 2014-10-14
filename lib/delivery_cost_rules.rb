class CostRows
  attr_reader :owner, :association, :cost_rules, :weights, :volumes
  
  def initialize(owner, association_name)
    @owner = owner
    @association = @owner.association(association_name)
    @cost_rules = @association.load_target.to_a
    @grouped_by_weight = @cost_rules.group_by(&:weight)
    @grouped_by_volume = @cost_rules.group_by(&:volume)
    @weights = @grouped_by_weight.keys.select {|w| w.present?}.sort
    @volumes = @grouped_by_volume.keys.select {|v| v.present?}.sort
  end
  
  def rows
    export = {}
    weights.each do |weight|
      export[weight] = volumes.map do |volume|
        cost_rules.find {|c| c.weight == weight && c.volume == volume}||build(:weight => weight, :volume => volume)
      end
      export[weight] << (cost_rules.find {|c| c.weight == weight && c.volume == nil}||build(:weight => weight))
    end
    export[:any] = volumes.map do |volume|
      cost_rules.find {|c| c.weight == nil && c.volume == volume}||build(:volume => volume)
    end
    export[:any] << (cost_rules.find {|c| c.weight == nil && c.volume == nil}||build)
    export.each {|w,a| export[w].sort!}
  end
  
  private
  def build(*args)
    association.build(*args)
  end
  
end

module DeliveryCostRules
  extend ActiveSupport::Concern
  
  module ClassMethods
      
    def delivery_cost_rules(*names)
      names.each do |name|
        assoc_name = name.to_s.pluralize.to_sym
        has_many assoc_name, :as => :delivery_to, :dependent => :delete_all, :inverse_of => :delivery_to
        accepts_nested_attributes_for assoc_name, :allow_destroy => true
  
        class_eval <<-EOV
          def #{name}_rows
            CostRows.new(self, :#{assoc_name})
          end
          def detect_#{name}(weight, volume = nil, cost = nil)
            weight_key = #{name}_rows.weights.find {|w| weight < w}||:any
            scope_by_weight = #{name}_rows.rows[weight_key]
            cost_rule = scope_by_weight.find {|cost_rule| cost_rule.volume.try(:includes?, volume)}||scope_by_weight.last
            if cost.present?
              cost_rule if cost < cost_rule.cost
            else
              cost_rule
            end
          end
        EOV
      end
    end
    
  end
  
end