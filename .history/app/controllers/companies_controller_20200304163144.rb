# frozen_string_literal: true

# company crud operations
class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_parameter)
    if @company.save
      flsash.alert = 'company created successfully'
      redirect_to company_path
    else
      flsash.alert = 'company created successfully'
      redirect_to company_path
    end
  end

  def show
    @companies = Company.all
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(paramsa[:id])
    @company.update(name: params[:company][:name], website: params[:company][:website], email: params[:company][:email])
    flash.alert = 'updated successfully'
  end

  private

  def company_parameter
    params.require(:company).permit(:name, :website, :email)
  end

  def find_company
    params.require(:company).permit(:email)
  end
end
