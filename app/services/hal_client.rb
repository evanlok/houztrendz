class HALClient
  attr_reader :video

  def initialize(video)
    @video = video
  end

  def generate
    response = client.post('/api/v1/video_contents') do |req|
      req.body = {
        video_type: Theme::VIDEO_TYPE,
        definition: video.theme.class_name,
        data: {},
        callback_url: callback_url,
        uid: video.id
      }
    end

    video.update(hal_id: response.body['id'])
  end

  def info
    fail "Video #{video.id} has not been generated yet" unless video.hal_id
    client.get("/api/v1/video_contents/#{video.hal_id}")
  end

  private

  def client
    @client ||= Faraday.new(ENV['HAL_URL'], headers: { 'Content-Type' => 'application/json' }) do |f|
      f.request :json
      f.request :retry
      f.response :logger, Rails.logger
      f.response :raise_error
      f.response :json
      f.adapter Faraday.default_adapter
    end
  end

  def host
    klass = ENV['URI_SCHEME'] == 'https' ? URI::HTTPS : URI::HTTP
    klass.build(host: ENV['HOST'], port: ENV['WEB_PORT'].to_i).to_s
  end

  def callback_url
    "#{host}/hal_video_callbacks"
  end
end
