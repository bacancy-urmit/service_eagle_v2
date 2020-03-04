# frozen_string_literal: true

class ServiceCentersController < ApplicationController
  def new
    @new_center = ServiceCenter.new
  end

  def create
    @new_center = ServiceCenter.new(allowed_parameters)
    if @new_center.save
      render :success
    else
      render :error
    end
  end

  def show
      @centers = ServiceCenter.all
  end

  def edit
      @center = ServiceCenter.find(params[:id])
  end

  def update
      @center = ServiceCenter.find(params[:id])
      @center.update(name: params[:service_center][:name], name: params[:service_center][:state], name: params[:service_center][:state], pincode: params[:service_center][:pincode], email: params[:service_center][:email])
  end

  private

  def allowed_parameters
    params.require(:service_center).permit(:name, :area, :city, :state, :pincode, :email)
  end
end
