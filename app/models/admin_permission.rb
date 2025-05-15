class AdminPermission < ApplicationRecord
  belongs_to :admin, class_name: 'User'
belongs_to :discussion, optional: true
belongs_to :reply, optional: true

end
