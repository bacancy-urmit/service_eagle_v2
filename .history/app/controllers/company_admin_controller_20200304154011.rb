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
    @company_admin = User.find(params[:id])
  end

  def update
    @company_admin = User.find(params[:id])
    @company_admin.update(firstname: params[:user][:firstname], lastname: params[:user][:lastname], username: params[:user][:username], contact: params[:user][:contact], email: params[:user][:eamil], password: params[:password])
    flash.alert = 'profile updated successfully'
    redirect_to company_admin_path
  end

  def show
    @company_admin = User.company_admins
  end

  def destroy
    @company_admin = User.find(params[:id])
    @company_admin.destroy
    flash.alert = 'company admin deleted successfully'
    redirect_to  company_admin_path
  end

  private

  def allow_company_admin_parameter
    params.require(:user).permit(:company_id, :firstname, :lastname, :username, :contact, :email, :password, :password_confirmation)
  end
end
