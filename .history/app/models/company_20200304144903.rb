# frozen_string_literal: true

class Company < ApplicationRecord
  # has_and_belongs_to_many :company_admin, class_name: 'User', foreign_key: 'company_admin_id'
  has_many :users , dependent: :destroy
  has_many :users, through: :company_admin
end
