class Admin::DashboardController < Admin::BaseController
  def index
    @stats = {
      users: User.count,
      channels: Channel.count,
      discussions: Discussion.count,
      replies: Reply.count
    }
    
    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_discussions = Discussion.includes(:user, :channel).order(created_at: :desc).limit(5)
  end
end