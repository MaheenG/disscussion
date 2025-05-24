class DiscussionsController < ApplicationController
  before_action :set_channel, except: [:index]
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:index, :show]

  # Global index: show all discussions across all channels
  def index
  if params[:channel_slug]
    @channel = Channel.friendly.find(params[:channel_slug])
    @discussions = @channel.discussions.includes(:user, :replies)
                          .ordered
                          .page(params[:page])
                          .per(20)
  else
    @discussions = Discussion.includes(:user, :channel, :replies)
                             .ordered
                             .page(params[:page])
                             .per(20)
  end
end


  # Show a single discussion scoped by channel if present
  def show
    @reply = Reply.new
    @replies = @discussion.replies
                         .includes(:user)
                         .ordered
                         .page(params[:page])
                         .per(10)
  end

  # New discussion in a specific channel
  def new
    @discussion = @channel.discussions.build
  end

  # Create discussion scoped to channel
  def create
    @discussion = @channel.discussions.build(discussion_params)
    @discussion.user = current_user

    if @discussion.save
      redirect_to channel_discussion_path(@channel, @discussion), 
                  notice: 'Discussion was successfully created.'
    else
      render :new
    end
  end

  # Edit discussion scoped to channel
  def edit
  end

  # Update discussion scoped to channel
  def update
    if @discussion.update(discussion_params)
      redirect_to channel_discussion_path(@channel, @discussion), 
                  notice: 'Discussion was successfully updated.'
    else
      render :edit
    end
  end

  # Delete discussion scoped to channel
  def destroy
    @discussion.destroy
    redirect_to channel_path(@channel), 
                notice: 'Discussion was successfully deleted.'
  end

  private

  # Find channel if present (for nested routes)
  def set_channel
    @channel = Channel.friendly.find(params[:channel_slug]) if params[:channel_slug]
  end

  # Find discussion scoped to channel if channel exists, otherwise global find
  def set_discussion
    @discussion = if @channel
                    @channel.discussions.friendly.find(params[:slug])
                  else
                    Discussion.friendly.find(params[:id])
                  end
  end

  def discussion_params
    params.require(:discussion).permit(:title, :content, :pinned)
  end
end
