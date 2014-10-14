class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include ApplicationHelper
  
  helper_method :current_user
  
  rescue_from CanCan::AccessDenied, :with => :access_denied
  
  before_filter :set_locale
  
  def set_locale
    I18n.locale = :ru
  end
  
  def access_denied
    if signed_in?
      redirect_to request.env["HTTP_REFERER"].present? ? :back : root_path, alert: I18n.t('dict.access_denied')
    else
      redirect_to new_user_session_path, alert: I18n.t('dict.access_denied')
    end
  end
  
  private
  def current_ability
    @current_ability ||= Ability.new(current_user, request)
  end
    
end
