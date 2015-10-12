User.create do |u|
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
