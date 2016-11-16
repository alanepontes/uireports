class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  layout :user_layout
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "Você não tem permissão para acessar essa área"
  end

  protected
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_index_path
    else
      profile_index_path
    end          
  end

	protected
  def user_layout
      if user_signed_in?	
      	if current_user.admin?
       		"admin"
       	else
       		"profile"  
       	end 
      else
    	  "application"	
      end  
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, 
                                                               :email, 
                                                               :password, 
                                                               :password_confirmation, 
                                                               :remember_me, 
                                                               educations_attributes: [:id, :degree], 
                                                               professions_attributes: [:id, :title],
                                                               knowledges_attributes: [:id, :title ], 
                                                               experiences_attributes: [:id, :title],
                                                               languages_attributes: [:id, :name])}

    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, 
                                                               :name, 
                                                               :email, 
                                                               :password, 
                                                               :remember_me) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, 
                                                                      :email, 
                                                                      :password, 
                                                                      :password_confirmation, 
                                                                      :current_password, 
                                                                      :avatar, 
                                                                      :about, 
                                                                      :age, 
                                                                      :work, 
                                                                      :study, 
                                                                      :city, 
                                                                      :country, 
                                                                      educations_attributes: [:id, :degree], 
                                                                      professions_attributes: [:id, :title], 
                                                                      knowledges_attributes: [:id, :title ],
                                                                      experiences_attributes: [:id, :title],
                                                                      languages_attributes: [:id, :name])}
  end
end
