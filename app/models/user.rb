class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: { user: 0, admin: 1 }
  
  has_many :discussions, dependent: :destroy
  has_many :replies, dependent: :destroy
  
  def admin?
    role == "admin"
  end
  
  def can_modify_discussion?(discussion)
    admin? || discussion.user_id == id
  end
end
