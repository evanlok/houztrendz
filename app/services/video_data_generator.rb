class VideoDataGenerator
  InsufficientDataError = Class.new(StandardError)

  SHARED_ATTRIBUTES = %w(county_name state cbsa_name zip_code tier_name).freeze
  STATS_ATTRIBUTES = %w(
    date
    new_listings_inventory_count
    new_listings_inventory_count_12m_change
    active_listings_inventory_count
    active_listings_inventory_count_1m_change
    sold_inventory_count
    sold_inventory_count_12m_change
    sold_inventory_count_1m_change
    sold_listings_dom_mean
    sold_listings_dom_mean_12m_change
    sold_list_price_mean
    sold_list_price_mean_12m_change
    sold_list_price_mean_1m_change
    active_list_price_mean
    active_list_price_median
    active_listings_dom_mean
    cumulative_active_dom_mean
  ).freeze

  AGENT_ATTRIBUTES = %w(first_name last_name email phone biography).freeze

  attr_reader :video

  def initialize(video)
    @video = video
  end

  def as_json
    fail InsufficientDataError, 'not enough data to build request' if core_logic_locations.length < 2
    stats = core_logic_locations.map { |c| c.attributes.slice(*STATS_ATTRIBUTES) }
    video_data = core_logic_locations.last.attributes.slice(*SHARED_ATTRIBUTES)
    video_data.merge!(stats: stats, agent: agent_data)
    video_data.deep_symbolize_keys!
  end

  private

  def core_logic_locations
    @core_logic_locations ||= CoreLogicLocation.where(zip_code: video.location).order(date: :desc).first(2).reverse
  end

  def agent_data
    agent_data = video.user.attributes.slice(*AGENT_ATTRIBUTES)
    agent_data.merge!(photo: video.user.avatar.url(:large), broker_logo: video.user.broker_logo.url(:large))
  end
end
