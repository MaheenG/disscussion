class DiscussionsController < ApplicationController
  before_action :set_channel, except: [:index]
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:index, :show]

  def index
  @channels = Channel.order(:name)  
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




  def show
    @reply = Reply.new
    @replies = @discussion.replies
                         .includes(:user)
                         .ordered
                         .page(params[:page])
                         .per(10)
  end

  def new
    @discussion = @channel.discussions.build
  end

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

  def edit
  end

  def update
    if @discussion.update(discussion_params)
      redirect_to channel_discussion_path(@channel, @discussion), 
                  notice: 'Discussion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @discussion.destroy
    redirect_to channel_path(@channel), 
                notice: 'Discussion was successfully deleted.'
  end

  private

  def set_channel
    @channel = Channel.friendly.find(params[:channel_slug]) if params[:channel_slug]
  end

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
