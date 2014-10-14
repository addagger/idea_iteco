class CropData < ActiveRecord::Base
  
  belongs_to :picture
  # validates_presence_of :picture_id, :crop_x, :crop_y, :crop_w, :crop_h
  
end