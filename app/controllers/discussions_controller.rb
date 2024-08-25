class DiscussionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_action :find_channels, only: [:index, :show, :new, :edit, :create]
  load_and_authorize_resource except: [:index]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.includes(:user, :channel)
                           .order(created_at: :desc)
    @discussions = @discussions.accessible_by(current_ability)
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @replies = @discussion.replies.includes(:user).order(created_at: :asc)
    @reply = Reply.new
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = current_user.discussions.build(discussion_params)

    if @discussion.save
      redirect_to @discussion, notice: 'Discussion was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    if @discussion.update(discussion_params)
      redirect_to @discussion, notice: 'Discussion was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion.destroy
    redirect_to discussions_url, notice: 'Discussion was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.friendly.find(params[:id])
    end

    def find_channels
      @channels = Channel.all.order('created_at desc')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:title, :content, :channel_id)
    end
end
