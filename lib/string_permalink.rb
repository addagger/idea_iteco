class String
  
  def to_permalink
    self.translit_from_rus.gsub(/\W+/, ' ').strip.downcase.gsub(/\ +/, '-')
  end
  
  def translit_from_rus
    I18n.transliterate(self)
  end
  
end