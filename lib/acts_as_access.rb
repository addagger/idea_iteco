module ActsAsAccess
  extend ActiveSupport::Concern
  
  module ClassMethods
    def acts_as_access(*args)
      options = args.extract_options!
      
      cattr_accessor :_access_options unless defined?(_access_options)
      self._access_options ||= options
      
      validates_presence_of :account_id, :message => :unregistered, :if => Proc.new {|a| a.email.present?}
      validates_presence_of :email
      validates_format_of :email, :with => Email::FORMAT_REGEXP, :if => Proc.new {|a| a.email.present?}
      
      validate do
        if account.blank? && email.present?
          if @email.match(Email::FORMAT_REGEXP)
            errors.add(:email, :unregistered)
          end
        elsif @email.present? && options[:uniq_proc].try(:call, self)
          errors.add(:email, :taken)
        elsif options[:except_proc].try(:call, self)
          errors.add(:email, :yours)
        end
      end
      
      class_eval <<-EOV
        def role?(base_role)
          if role.present?
            _access_options[:roles].index(base_role.to_s) <= _access_options[:roles].index(role.to_s)
          else
            false
          end
        end

        def role=(value)
          super(value.to_s) if value.to_s.in?(_access_options[:roles])
        end

        def role_index
          _access_options[:roles].index(role.to_s)||0
        end

        def i18n_role
          I18n.t("role.\#{self.class.model_name.singular}.\#{role}") if role
        end

        def email
          @email||account.try(:email)
        end

        def email=(value)
          @email = value
          self.account = case value
          when Account then value
          when Fixnum then Account.find(value)
          when String then
            if value.match(Email::FORMAT_REGEXP)
              Account.find_by_email(value)
            end
          end
        end
      EOV
      
    end
    
  end
  
end