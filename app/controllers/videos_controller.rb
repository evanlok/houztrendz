class VideosController < ApplicationController
  before_action :authenticate_user!

  def new
    @video = Video.new
    @themes = Theme.all
  end

  def create
    @video = current_user.videos.build(video_params)

    if @video.save
      redirect_to current_profile_url, notice: "Created video for: #{@video.location}"
    else
      @themes = Theme.all
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:location, :theme_id, :background_color)
  end
end
