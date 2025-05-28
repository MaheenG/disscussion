# Ye controller discussions ki sari functionalities handle krta hai
# Jaise k new discussion banana, edit krna, delete krna, etc.
class DiscussionsController < ApplicationController
  # User ko login hona zaruri hai kisi bhi action k liye
  before_action :authenticate_user!
  # Har action se pehle specific discussion ko dhundta hai
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  # Check krta hai k user authorized hai ya nahi edit/update/delete k liye
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  # Channels ki list load krta hai
  before_action :find_channels, only: [:index, :show, :new, :edit, :create]
  load_and_authorize_resource except: [:index]

  # Sare discussions ko date k hisab se show krta hai
  def index
    @discussions = Discussion.all.order(created_at: :desc)
  end

  # Single discussion ko uske replies k sath show krta hai
  def show
    @discussions = Discussion.all.order(created_at: :desc)
    @replies = @discussion.replies.includes(:user).order(created_at: :asc)
    @reply = Reply.new
  end

  # Naya discussion create krne ka form
  def new
    @discussion = current_user.discussions.build
  end

  # Existing discussion ko edit krne ka form
  def edit
  end

  # Naya discussion create krta hai
  def create
    @discussion = current_user.discussions.build(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: '✨ Discussion was successfully created!' }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # Existing discussion ko update krta hai
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: '✨ Discussion was successfully updated!' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # Discussion ko delete krta hai
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: '✨ Discussion was successfully deleted!' }
      format.json { head :no_content }
    end
  end

  private

  # Discussion ko database se dhundta hai ID k through
  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  # Sare channels ko load krta hai
  def find_channels
    @channels = Channel.all.order('created_at desc')
  end

  # Form se ane wali values ko filter krta hai security k liye
  def discussion_params
    params.require(:discussion).permit(:title, :content, :channel_id)
  end

  # Check krta hai k user admin hai ya discussion ka owner hai
  def authorize_user!
    unless current_user.admin? || @discussion.user == current_user
      redirect_to discussions_path, alert: '⚠️ You are not authorized to perform this action!'
    end
  end
end
