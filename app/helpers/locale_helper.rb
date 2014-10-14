module LocaleHelper
  
  def bootstrap_select_locale
    { :ru => "ru_RU", 
      :en => "en_US" }[I18n.locale]
  end
  
  def summernote_locale
    { :ru => "ru_RU", 
      :en => "en_US" }[I18n.locale]
  end
  
end