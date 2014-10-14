module HasPicture
  extend ActiveSupport::Concern
  
  module ClassMethods
    def has_one_picture(*args)
      options = args.extract_options!
      args.each do |picas|
        assoc_name = options[:as]||picas
        has_one assoc_name, :as => :resource, :class_name => picas.to_s.classify
        class_eval <<-EOV
          def #{picas}?
            #{assoc_name}||association(:#{assoc_name}).send(:build_record, {}) # init, but not collect to target
          end
          
          def #{picas}_picture
            #{picas}?.picture||Picture.new
          end
          
        EOV
      end
    end
    def has_many_pictures(*args)
      options = args.extract_options!
      args.each do |picas|
        assoc_name = options[:as]||:"#{picas.to_s.pluralize}"
        has_many assoc_name, :as => :resource, :class_name => picas.to_s.classify
        class_eval <<-EOV
          def #{picas}?
            #{assoc_name}.last||association(:#{assoc_name}).send(:build_record, {}) # init, but not collect to target
          end
          
          def #{picas}_picture
            #{picas}?.picture||Picture.new
          end
          
        EOV
      end
    end
  end
  
  def attached_picture_reflections
    self.class.reflections.map {|k, r| r if r.class_name.in?(Picture.usable_as.map(&:name))}.compact
  end

  def attached_picture_reflection(klass)
    attached_picture_reflections.find do |r|
      (r.klass < ActiveRecord::Base ? r.klass == klass : false)||(r.class_name == klass)
    end
  end

  def attached_picture?(klass, picture)
    if attached = try(attached_picture_reflection(klass).try(:name))
      if attached_picture_reflection(klass).collection?
        attached.where(:picture_id => picture.id).limit(1).any?
      else
        attached.picture == picture
      end
    end
  end
  
end