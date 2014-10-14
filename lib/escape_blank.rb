module EscapeBlank
  extend ActiveSupport::Concern
  
  module ClassMethods
    def escape_blank_html(*args)
      args.each do |attribute|
        class_eval <<-EOV
          def #{attribute}=(value)
            checked = case value
            when String then GlobalHelper.html_has_any_content?(value) ? value : nil
            else value
            end
            super(checked)
          end
        EOV
      end
    end
    def escape_blank(*args)
      args.each do |attribute|
        class_eval <<-EOV
          def #{attribute}=(value)
            checked = case value
            when String then value.present? ? value : nil
            else value
            end
            super(checked)
          end
        EOV
      end
    end
  end
  
end