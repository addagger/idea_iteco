module HasColor
  extend ActiveSupport::Concern
  
  module ClassMethods
    def has_one_color(*args)
      options = args.extract_options!
      args.each do |colas|
        assoc_name = options[:as]||colas
        has_one assoc_name, :as => :resource, :class_name => colas.to_s.classify
        class_eval <<-EOV
          def #{colas}?
            #{assoc_name}||association(:#{assoc_name}).send(:build_record, {}) # init, but not collect to target
          end
          
          def #{colas}_color
            #{colas}?.color||Color.new
          end
          
        EOV
      end
    end
    def has_many_colors(*args)
      options = args.extract_options!
      args.each do |colas|
        assoc_name = options[:as]||:"#{colas.to_s.pluralize}"
        has_many assoc_name, :as => :resource, :class_name => colas.to_s.classify
        class_eval <<-EOV
          def #{colas}?
            #{assoc_name}.last||association(:#{assoc_name}).send(:build_record, {}) # init, but not collect to target
          end
          
          def #{colas}_color
            #{colas}?.color||Color.new
          end
          
        EOV
      end
    end
  end
  
  def attached_color_reflections
    self.class.reflections.map {|k, r| r if r.class_name.in?(Color.usable_as.map(&:name))}.compact
  end

  def attached_color_reflection(klass)
    attached_color_reflections.find do |r|
      (r.klass < ActiveRecord::Base ? r.klass == klass : false)||(r.class_name == klass)
    end
  end

  def attached_color?(klass, color)
    if attached = try(attached_color_reflection(klass).try(:name))
      if attached_color_reflection(klass).collection?
        attached.where(:color_id => color.id).limit(1).any?
      else
        attached.color == color
      end
    end
  end
  
end