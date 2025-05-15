class SyntaxHighlight < ApplicationRecord
    belongs_to :content, polymorphic: true

end
