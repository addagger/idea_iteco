class Quote < ActiveRecord::Base
  
  scope :random, -> { order("RANDOM()") }
  
end
