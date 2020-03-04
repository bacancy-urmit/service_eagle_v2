# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
   super
  end

  # POST /resource/sign_in
  def create
    #  super
    if current_user.has_role? :super_admin 
      # puts "abC"
      # redirect_to companies_new_path 
      redirect_to  super_admin_index_path
    elsif current_user.has_role? :company_admin
      redirect_to  company_admin_index_path
    
    else
      render  "user/userindex"
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
