require 'devise'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Manual role implementation instead of enum
  ROLE_MEMBER = 0
  ROLE_MODERATOR = 1
  ROLE_ADMIN = 2

  ROLES = {
    member: ROLE_MEMBER,
    moderator: ROLE_MODERATOR,
    admin: ROLE_ADMIN
  }.freeze

  validates :role, presence: true, inclusion: { in: ROLES.values }

  has_many :discussions, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one_attached :avatar

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true, 
            format: { with: /\A[a-zA-Z0-9_]+\z/, message: "can only contain letters, numbers, and underscores" }

  before_validation :set_default_role, on: :create

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_name
    username.presence || full_name
  end

  # Role helper methods
  def role_name
    ROLES.key(role)
  end

  def role_member?
    role == ROLE_MEMBER
  end

  def role_moderator?
    role == ROLE_MODERATOR
  end

  def role_admin?
    role == ROLE_ADMIN
  end

  private

  def set_default_role
    self.role ||= ROLE_MEMBER
  end
end
