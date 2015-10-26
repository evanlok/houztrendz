class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :load_video, only: [:show, :update, :destroy]
  after_action :verify_authorized, except: :new

  def new
    @video = Video.new
    @themes = Theme.all
  end

  def create
    @video = current_user.videos.build(video_params)
    authorize @video

    if @video.save
      redirect_to current_profile_url, notice: "Created video for: #{@video.location}"
    else
      @themes = Theme.all
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to current_profile_url, notice: "Updated video: #{@video.title}"
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to current_profile_url, notice: "Deleted video: #{@video.title}"
  end

  private

  def load_video
    @video = Video.find(params[:id])
    authorize @video
  end

  def video_params
    params.require(:video).permit(:location, :theme_id, :background_color)
  end
end
