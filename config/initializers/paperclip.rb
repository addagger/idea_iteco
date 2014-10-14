require 'paperclip_jcropping'
require 'paperclip_deleting'

Paperclip::Attachment.default_options.merge!(
  :url => "/system/:class/:id/:attachment/:style_:basename.:extension",
  :default_url => "missing_:class_:attachment_:style.png")

Paperclip::AttachmentRegistry.module_eval do
  def definitions_for(klass)
    klass.ancestors.each_with_object({}) do |ancestor, inherited_definitions|
      inherited_definitions.deep_merge! @attachments[ancestor]
    end
  end
end