# frozen_string_literal: true

class ServiceCenter < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :users, through: :user_servicecenter
  has_many :users, dependent: :destory
  has_many :users, through: :appoinment_bookings, dependent: :destory
end
