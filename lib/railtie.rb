class Railtie < ::Rails::Railtie
  config.before_initialize do
    ActiveSupport.on_load :active_record do
      require 'has_picture'
      require 'has_money'
      require 'has_country'
      require 'acts_as_access'
      require 'counters_zero'
      require 'formatted_date_time'
      require 'unused'
      require 'escape_blank'
      require 'acts_as_taggable'
      
      ActiveRecord::Base.send(:include, HasPicture)
      ActiveRecord::Base.send(:include, HasMoney)
      ActiveRecord::Base.send(:include, HasCountry)
      ActiveRecord::Base.send(:include, ActsAsAccess)
      ActiveRecord::Base.send(:include, CountersZero)
      ActiveRecord::Base.send(:include, FormattedDateTime)
      ActiveRecord::Base.send(:include, EscapeBlank)
      ActiveRecord::Base.send(:include, ActsAsTaggable)
      # html_slicer global config
      HtmlSlicer.configure do |config|
        config.slice = {:complete => /\s+|\z/, :text_break => "...", :except => {:tag => "table"}}
      end
    end
    ActiveSupport.on_load :action_view do
    end
  end
end