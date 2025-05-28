class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @my_discussions = current_user.discussions
    @my_replies = current_user.replies
  end
end 