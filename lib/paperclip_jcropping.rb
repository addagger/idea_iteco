module Paperclip
  module ClassMethods
    def paperclip_jcropping(*args)
      options = args.extract_options!
      attachment = args.first
      croppable_style = {:croppable => args.second}
      skip_styles = Array(options[:skip_styles])
      if definitions = Paperclip::AttachmentRegistry.instance.instance_variable_get(:@attachments)[self][attachment]
        if definitions[:styles].is_a?(Hash)
          definitions[:styles].merge!(croppable_style)
        else
          definitions[:styles] = croppable_style
        end
        if definitions[:processors].is_a?(Array)
          definitions[:processors] += [:cropper]
        else
          definitions[:processors] = [:cropper]
        end
        Paperclip::AttachmentRegistry.register self, attachment, definitions
      else
        raise ArgumentError, "No attachment #{attachment} defined or Paperclip doesn't installed"
      end
      
      attr_reader :orientation
      
      after_update "reprocess_#{attachment}", :if => :cropping?
      
      class_eval <<-EOV
        def #{attachment}_geometry(style = :original)
          @geometry ||= {}
          @geometry[style] ||= Paperclip::Geometry.from_file(#{attachment}.path(style)).tap do |geometry|
            @orientation = geometry.auto_orient
          end
        end

        def resolution(style = :original)
          [#{attachment}_geometry(style).width.round, #{attachment}_geometry(style).height.round].join("x")
        end

        def original_width
          #{attachment}_geometry(:original).width
        end
        
        def original_height
          #{attachment}_geometry(:original).height
        end
        
        def croppable_width
          #{attachment}_geometry(:croppable).width
        end
        
        def croppable_height
          #{attachment}_geometry(:croppable).height
        end

        def square?(style = :original)
          begin
            #{attachment}_geometry(style).square?
          rescue
            false
          end
        end

        def crop_coords(coord)
          x_ratio = original_width/croppable_width
          y_ratio = original_height/croppable_height
          result = case coord
          when :x then (crop_x||0)/x_ratio
          when :y then (crop_y||0)/y_ratio
          when :x2 then ((crop_x||0)+(crop_w||original_width))/x_ratio
          when :y2 then ((crop_y||0)+(crop_h||original_height))/y_ratio
          end
          result.round
        end

        def cropping?
          croppable? && !(@crop_executed || false)
        end

        def croppable?
          !#{attachment}.uploaded_file.present? && croppable_coords?
        end

        def croppable_coords?
          crop_x.present? || crop_y.present? || crop_w.present? || crop_h.present?
        end

        private

        def reprocess_#{attachment}
          @crop_executed = true
          #{attachment}.reprocess!(*(self.class.attachment_definitions[:#{attachment}][:styles].keys - #{skip_styles}))
          @crop_executed = nil
        end
      EOV
    
    end
  end
  
  class Cropper < Thumbnail
    def transformation_command
      if command = crop_command
        command + super
      else
        super
      end
    end
    
    def crop_command
      target = @attachment.instance
      if target.croppable?
        [" -auto-orient -crop '#{target.crop_w}x#{target.crop_h}+#{target.crop_x}+#{target.crop_y}'"]
      end
    end
    
  end
  
end