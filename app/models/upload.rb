class Upload < ActiveRecord::Base
  ORIGIN = %w{fileupload editor}
  
  belongs_to :store
  belongs_to :resource, :polymorphic => true
  
  has_attached_file :src
  
  validates_attachment :src, :presence => true, :size => { :in => 0..5.megabytes },
                       :content_type => { :content_type => [/application|audio|image/, "text/plain"] }
  
  # before_create :randomize_file_name
  
  include Rails.application.routes.url_helpers

  after_initialize do
    self.origin ||= "fileupload"
  end

  def to_jq_upload(*path_resources)
    { "name" => read_attribute(:src_file_name),
      "size" => read_attribute(:src_file_size),
      "description" => read_attribute(:description),
      "url" => src.url,
      "objectUrl" => polymorphic_path(path_resources + [self]),
      "origin" => i18n_origin,
      "deleteType" => "DELETE",
      "recordId" => record_id }
  end
  
  def i18n_origin
    I18n.t("upload.meta.origin.#{origin}")
  end

  def multiple_src=(values = [])
    self.src = values.first
  end

  def origin=(value)
    super(value.to_s) if value.to_s.in?(ORIGIN)
  end

  def resource_class_for_url
    resource.try(:class)||"common"
  end

  def to_s
    src_file_name
  end
  
  def file_size
    src_file_size
  end
  
  def content_type
    src_content_type
  end
  
  def url(*args)
    src.try(:url, *args)
  end

  # private
  # 
  # def randomize_file_name
  #   extension = File.extname(src_file_name)
  #   src.instance_write(:file_name,  "#{SecureRandom.urlsafe_base64(16)}#{extension}")
  # end
  
end