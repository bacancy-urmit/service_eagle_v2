# frozen_string_literal: true

class ServiceCenter < ApplicationRecord
  def new
    @new_center = ServiceCenter.new
  end

  def create
    @new_center = ServiceCenter.new(allowed_parameter)
  end
end
