module ActsAsTaggable
  extend ActiveSupport::Concern
  
  module ClassMethods
    def acts_as_taggable
      has_many :taggings, -> { order("taggings.created_at") }, :as => :resource, :dependent => :destroy
      before_save :commit_tags
      before_destroy :remove_all_tags
      send(:include, Taggable)
    end
    
  end
  
  module Taggable
    # reader attribute (returns String)
    def tags(delimeter = ",")
      current_tags.map {|c| c.split.size > 1 && delimeter == " " ? "\"#{c}\"" : c}.join(delimeter)
    end

    # writer attribute (accepts String)
    def tags=(value)
      if value.kind_of?(String)
        @tags = value.split(",").uniq.map(&:strip)
      elsif value.kind_of?(Array)
        @tags = value.uniq.map(&:strip)
      end
    end

    # returns stored in DB tags
    def linked_tags
      taggings.map {|tagging| tagging.tag.value}
    end

    # returns raw Tag instances
    def current_tags
      @tags||linked_tags
    end

    # which tags need to be added
    def tags_to_add
      current_tags - linked_tags
    end

    # which tags need to be removed
    def tags_to_remove
      linked_tags - current_tags
    end

    private

    def commit_tags
      add_tags(tags_to_add)
      remove_tags(tags_to_remove)
    end

    def remove_all_tags
      remove_tags(linked_tags)
    end

    def add_tags(values = [])
      values.each do |tag_value|
        tag = Tag.find_or_create_by(:value => tag_value)
        taggings.build(:tag_id => tag.id)
      end
    end

    def remove_tags(values = [])
      values.each do |tag_value|
        taggings.includes(:tag).where(:tags => {:value => tag_value}).try(:destroy_all)
      end
    end
  end
  
end