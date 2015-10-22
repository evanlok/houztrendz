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
    v.url_sd = 'http://www.hal.com/video_sd.mp4'
    v.url_hd = 'http://www.hal.com/video_hd.mp4'
    v.duration = 180
    v.thumbnail_url = "http://placehold.it/640x360?text=#{theme.name} #{v.location}"
    v.hal_id = 100 + i
  end
end
