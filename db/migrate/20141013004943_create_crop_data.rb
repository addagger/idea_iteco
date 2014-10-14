class CreateCropData < ActiveRecord::Migration
  def change
    create_table :crop_data do |t|
      t.integer :picture_id
      t.integer :crop_x
      t.integer :crop_y
      t.integer :crop_w
      t.integer :crop_h
      t.timestamps
    end
  end
end
