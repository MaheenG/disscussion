class Admin::DashboardController < ApplicationController
  def index
    @stats = {
      users: User.count,
      channels: Channel.count,
      discussions: Discussion.count,
      replies: Reply.count
    }

    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_discussions = Discussion.includes(:user, :channel).order(created_at: :desc).limit(5)

    @discussions = Discussion.includes(:user).order(created_at: :desc).limit(10)

    if @discussions.empty?
      admin = User.find_by(role: 'admin') || User.first

      default_channel = Channel.first || Channel.create(name: 'General')

      default_discussion = Discussion.find_or_create_by(title: 'Welcome to the Forum', user: admin) do |d|
        d.body = 'This is a default discussion created by the admin.'
        d.channel = default_channel
      end

      @discussions = [default_discussion]
    end

    @replies = Reply.includes(:user).all
  end
end
