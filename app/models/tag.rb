class Tag < ActiveRecord::Base
  
  has_many :taggings, :through => :store_tags, :source => :taggings
  
  validates_presence_of :value
  validates_format_of :value, :with => /\p{Word}+/
  
  scope :query, ->(query) do
    if query.present?
      where("tags.value ~* :query", :query => ".*#{query}.*").references(:tags)
    end
  end
  
end
