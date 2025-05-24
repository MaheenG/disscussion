class HomeController < ApplicationController
  # Authenticate for all except index and show
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @channels = Channel.includes(:discussions).ordered
    @recent_discussions = Discussion.includes(:user, :channel, :replies)
                                   .ordered
                                   .limit(10)
    @total_discussions = Discussion.count
    @total_replies = Reply.count
    @total_users = User.count
  end

  def show
    # Example show action - you can customize this
    # For example, show a particular channel or info page
  end
end
