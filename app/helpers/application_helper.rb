module ApplicationHelper
  
  def page_title(*args, &block)
    options = args.extract_options!
    title = args.first||""
    title += capture(&block) if block_given?
    render("shared/page_title", :title => raw(title), :subtitle => options[:subtitle], :bg => options[:bg])
  end
  
  def page_title_extended(*args, &block)
    options = args.extract_options!
    title = args.first||""
    title += capture(&block) if block_given?
    render("shared/page_title_extended", :title => raw(title), :subtitle => options[:subtitle], :scroll_to => options[:scroll_to], :bg => options[:bg])
  end
  
  def phone_country_codes_for_select
    Country.all.map do |array|
      country = Country[array.last]
      ["#{country.translations[I18n.locale.to_s]} (+#{country.country_code})", country.alpha2]
    end
  end
  
end
