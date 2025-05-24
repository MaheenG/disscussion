class Discussion < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  belongs_to :channel
  has_many :replies, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  scope :ordered, -> { order(created_at: :desc) }
  scope :pinned_first, -> { order(pinned: :desc, created_at: :desc) }

  def replies_count
    replies.count
  end

  def latest_reply
    replies.order(created_at: :desc).first
  end

  def content_html
    MarkdownRenderer.new.render(content)
  end

  def excerpt(limit: 150)
    ActionController::Base.helpers.truncate(
      ActionController::Base.helpers.strip_tags(content_html), 
      length: limit
    )
  end
end