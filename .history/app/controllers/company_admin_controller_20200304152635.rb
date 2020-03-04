# frozen_string_literal: true

class CompanyAdminController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allow_company_admin_parameter)
    @user.company_admins.build(company_id: params[:company_id])
    @companyadmin = CompanyAdmin.new
    @companyadmin.company_id = params[:company_id]
    if @user.save
      @companyadmin.user_id = current_user.id
      @companyadmin.save
      @user.add_role :company_admin
      flash.alert = 'company admin created successfully'
      redirect_to super_admins_path
    else
      flash.alert = 'company admin not created successfully!!!!'
      redirect_to super_admins_path
    end
  end

  def edit
    @service_center_admin = User.find(params[:id])
  end

  def update
    @service_center_admin = User.find(params[:id])
    @service_center_admin.update(firstname: params[:user])
  end

  def show
    @service_center_admin = User.company_admins
  end

  def destroy
    @service_center_admin = User.find(params[:id])
    @service_center_admin.destroy
    flash.alert = 'company admin deleted successfully'
    redirect_to  company_admin_path
  end

  private

  def allow_company_admin_parameter
    params.require(:user).permit(:firstname, :lastname, :username, :contact, :email, :password, :password_confirmation)
  end
end
