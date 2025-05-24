require 'devise'

class TestUser < ApplicationRecord
  devise :database_authenticatable
end
