class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :discussions
  has_many :replies
  has_many :admin_permissions, foreign_key: :admin_id

  # Constants for roles
  ROLE_USER  = 0
  ROLE_ADMIN = 1

  # Set default role after initialization
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= ROLE_USER
  end

  # Role check methods
  def admin?
    role == ROLE_ADMIN
  end

  def user?
    role == ROLE_USER
  end

  # Optional scopes
  scope :admins, -> { where(role: ROLE_ADMIN) }
  scope :users,  -> { where(role: ROLE_USER) }
end
