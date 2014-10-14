class User < ActiveRecord::Base
  
  ROLES = %w{visitor moderator admin}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable#, :omniauth_providers => [:facebook, :twitter, :linkedin]
  
  has_one :person
  accepts_nested_attributes_for :person, :allow_destroy => true

  def role?(base_role)
    if role.present?
      ROLES.index(base_role.to_s) <= ROLES.index(role.to_s)
    else
      false
    end
  end

  def role=(value)
    super(value.to_s) if value.to_s.in?(ROLES)
  end

  def role_index
    ROLES.index(role.to_s)||0
  end

  def i18n_role
    I18n.t("user.roles.#{role}") if role
  end
  
end
