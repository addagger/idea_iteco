class Picture < Upload
  
  belongs_to :resource, :polymorphic => true
  
  has_one :crop_data, :dependent => :delete
  accepts_nested_attributes_for :crop_data
  
  has_many :logos, :dependent => :delete_all
  has_many :avatars, :dependent => :delete_all
  has_many :images, :dependent => :delete_all
  has_many :bg_images, :dependent => :delete_all
  
  has_attached_file :src, :styles => {:thumb => "350", :current => "800>", :wide => "1920>", :original_thumb => "350" }

  validates_attachment :src, :presence => true, :size => { :in => 0..5.megabytes }, :content_type => { content_type: /image/ }
  
  paperclip_jcropping :src, "568", :skip_styles => [:croppable, :original_thumb]
  
  delegate *[:crop_x, :crop_y, :crop_w, :crop_h].map {|a| [a, :"#{a}="]}.flatten, :to => :crop_data
  
  def crop_data
    super||build_crop_data
  end
  
  def to_jq_upload(*path_resources)
    super.merge({"url" => src.url(:original), "thumbnailUrl" => src.url(:thumb), "currentUrl" => src.url(:current), "wideUrl" => src.url(:wide), "croppedUrl" => croppable_coords? ? edit_polymorphic_path(path_resources + [self]) : nil})
  end
  
  def iconable?
    square?(:thumb)
  end
  
  def self.usable_as
    reflections.map {|k, r| r.klass if r.collection?}.compact
  end
    
end