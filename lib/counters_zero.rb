module CountersZero
  extend ActiveSupport::Concern
  
  module ClassMethods
  end
  
  def all_counters_zero_except?(*attrs)
    attrs.map!(&:to_s)
    begin
      attributes.each do |column, count|
        if column.match(/_count\z/) && !column.in?(attrs)
          unless count.to_i == 0
            raise Exception
          end
        end
      end
      true
    rescue Exception
      false
    end
  end
  
  def equal_counters_with?(owner)
    begin
      attributes.each do |column, count|
        if column.match(/_count\z/) && owner.respond_to?(column)
          unless owner.send(column) == count
            raise Exception
          end
        end
      end
      true
    rescue Exception
      false
    end
  end
  
end