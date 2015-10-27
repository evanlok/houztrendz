class HalVideoCallbacksController < ActionController::Base
  def create
    begin
      @video = Video.find_by!(hal_id: params[:id])
    rescue ActiveRecord::RecordNotFound => e
      Honeybadger.notify(e)
      render json: { errors: ['Record not found'] }, status: :not_found and return
    end

    @video.update(
      thumbnail_url: params[:thumbnail_url],
      duration: params[:duration],
      url_sd: params[:video_url_360],
      url_hd: params[:video_url_720]
    )

    render json: { status: 'ok' }
  end
end
