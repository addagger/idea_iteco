module Unused
  extend ActiveSupport::Concern
  
  def unused?(*except)
    except.map!(&:to_sym)
    eval(self.class.reflections.map {|r| try(r[0]).try(:blank?) unless except.include?(r[0])}.compact.join(" && "))
  end
  
end