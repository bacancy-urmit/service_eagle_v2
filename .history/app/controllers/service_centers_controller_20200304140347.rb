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

  private

  def allowed_parameters
    params.require(:service_center).permit(:name, :area, :city, :state, :pincode, :email)
  end
end
