class Channel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :discussions, dependent: :destroy
  has_many :replies, through: :discussions

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :color, presence: true, format: { with: /\A#[0-9A-Fa-f]{6}\z/ }

  scope :ordered, -> { order(:name) }

  def discussions_count
    discussions.count
  end

  def replies_count
    replies.count
  end

  def latest_discussion
    discussions.order(created_at: :desc).first
  end
end
