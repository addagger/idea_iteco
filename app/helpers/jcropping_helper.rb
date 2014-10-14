module JcroppingHelper
  
  def jcropping(builder, image)
    resolution = builder.object.class.attachment_definitions[image][:styles][:croppable].scan(/\d+/)
    fields = render('shared/jcropping', :f => builder, :image => image, :resolution => resolution)
  end
  
end