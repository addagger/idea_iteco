module Paperclip
  module ClassMethods
    def paperclip_deleting(*args)
      accessors = args.collect {|attachment| "delete_#{attachment}"}
      validations = args.collect {|attachment| "#{attachment}.clear if delete_#{attachment} == '1'"}
      
      attr_accessor *accessors
      #attr_accessible *accessors
      
      before_validation { eval(validations.join("; ")) }
    
    end
  end
  
end