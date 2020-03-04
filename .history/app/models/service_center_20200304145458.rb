# frozen_string_literal: true

class ServiceCenter < ApplicationRecord
  def new
    @new_center = ServiceCenter.new
  end

  def create
    @new_center = ServiceCenter.new(allowed_parameter)
    if @new_center.save
      flash.alert = 'servicecenter is created'
    else
      
    end
  end
end
