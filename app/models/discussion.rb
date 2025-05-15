class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :channel
 
has_many :replies
has_one :slug
has_many :syntax_highlights, as: :content

end
