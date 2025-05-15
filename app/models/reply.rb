class Reply < ApplicationRecord
  
  belongs_to :user
belongs_to :discussion
has_many :syntax_highlights, as: :content

end
