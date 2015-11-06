user = User.create do |u|
  u.email = 'admin@houztrendz.com'
  u.password = 'test1234'
  u.first_name = 'John'
  u.last_name = 'Doe'
  u.phone = '555-555-5555'
  u.title = 'Super Agent'
  u.biography = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh lacus, pharetra non aliquam ' \
  'eu, sodales in mauris. Vivamus mattis nunc lacus, eu aliquet enim dignissim at. Fusce in quam ac mi posuere congue '\
  'lobortis a nibh. Nam maximus dui eget ligula auctor, non pellentesque nisi posuere. Suspendisse nec mauris sodales, '\
  'semper eros ut, lobortis magna. '
  u.admin = true
  u.remote_avatar_url = 'https://s3.amazonaws.com/vejeo/uploads/vidgenie_agent/photo/100000/medium_agent-onvedeo-notfound.png'
  u.remote_broker_logo_url = 'https://s3.amazonaws.com/vejeo/uploads/vidgenie_agent/photo/100000/medium_agent-onvedeo-notfound.png'
end

%w(Coral Flight Pasture).each do |name|
  Theme.create do |t|
    t.name = name
    t.class_name = name
    t.active = true
    t.thumbnail_url = "http://placehold.it/240x180?text=#{name}"
  end
end

(Theme.all + Theme.first(2)).each_with_index do |theme, i|
  Video.create do |v|
    v.theme = theme
    v.user = user
    v.location = 94101 + i
    v.title = "#{Date::MONTHNAMES[i+1]} 2015 Market Trends"
    v.background_color = '#d91515'
    v.url_sd = 'https://s3.amazonaws.com/video-snippets/encoded/014a229c-4198-4999-bdfe-3f1223498503_720.mp4'
    v.url_hd = 'https://s3.amazonaws.com/video-snippets/encoded/00d32e93-1dd6-4859-a374-0cc077df1d21_720.mp4'
    v.duration = 180
    v.thumbnail_url = "http://placehold.it/640x360?text=#{theme.name} #{v.location}"
    v.hal_id = 100 + i
  end
end

[94101, 94102, 94103, 94104, 94105, 94107, 94108, 94109].each do |zip|
  CoreLogicLocation.create!(
    date: Date.today,
    county_name: 'San Francisco',
    state: 'CA',
    cbsa_name: 'San Francisco Bay Area',
    zip_code: zip,
    tier_name: 'Single Family',
    new_listings_inventory_count: rand(100),
    new_listings_inventory_count_12m_change: rand(0..20.0).round(2),
    active_listings_inventory_count: rand(100),
    active_listings_inventory_count_1m_change: rand(0..20.0).round(2),
    sold_inventory_count: rand(100),
    sold_inventory_count_12m_change: rand(0..20.0).round(2),
    sold_inventory_count_1m_change: rand(0..20.0).round(2),
    sold_listings_dom_mean: rand(100),
    sold_listings_dom_mean_12m_change: rand(0..20.0).round(2),
    sold_list_price_mean: rand(500000),
    sold_list_price_mean_12m_change: rand(0..20.0).round(2),
    sold_list_price_mean_1m_change: rand(0..20.0).round(2),
    active_list_price_mean: rand(500000),
    active_list_price_median: rand(500000),
    active_listings_dom_mean: rand(100),
    cumulative_active_dom_mean: rand(100)
  )
end

Message.create(
  recipient: user,
  sender_name: 'John Doe',
  sender_email: 'user@houztrendz.com',
  sender_phone: '415-456-7890',
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas elit enim, consectetur et nisi quis, congue "\
  "efficitur nisl. Mauris non nisi a tortor tempor luctus et et sem.\n\nIn hac habitasse platea dictumst. Etiam varius " \
  "scelerisque ante, in porta orci tincidunt tempor."
)
