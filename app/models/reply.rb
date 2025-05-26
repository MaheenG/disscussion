class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  validates :reply, presence: true

  extend FriendlyId
  friendly_id :content_for_slug, use: [:slugged, :finders]

  def content_for_slug
    reply
  end

  def should_generate_new_friendly_id?
    reply_changed? && !slug_changed?
  end
end
