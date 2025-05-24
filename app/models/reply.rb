class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :discussion

  validates :content, presence: true

  scope :ordered, -> { order(created_at: :asc) }

  def content_html
    MarkdownRenderer.new.render(content)
  end
end