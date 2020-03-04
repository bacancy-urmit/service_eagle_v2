class User < ApplicationRecord
  rolify
  has_many :user_servicecenters, dependent: :def destroy
  has_many :servicecenters, through: :user_servicecenters
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
