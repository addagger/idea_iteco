module GlobalHelper
  
  def self.lfts_to_ranges(objects = [])
    r = Array(objects).map {|object| Range.new(object.lft, object.rgt).to_a}.flatten.uniq.sort
    begin_id = r[0]
    collection = []
    r.each_index do |index|
      unless r[index+1] and r[index+1] == r[index]+1 
        collection << Range.new(begin_id, r[index])
        begin_id = r[index+1]
      end
    end
    collection
  end
  
  def self.html_has_any_content?(html = nil)
    html = html.to_s
    if html.present?
      node = HTML::Document.new(html).root
      a = Proc.new do |node|
        node.children.each do |subnode|
          if (subnode.is_a?(HTML::Text) && subnode.content.present?) || (subnode.is_a?(HTML::Tag) && subnode.name.in?(%w{iframe img object video}))
            raise Exception
          elsif subnode.children.any?
            a.call(subnode)
          end
        end
      end
      begin
        a.call(node)
        false
      rescue Exception
        true
      end
    end
  end
  
end