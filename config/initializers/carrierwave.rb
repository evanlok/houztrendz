if Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS', # required
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'], # required
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] # required
      #:region => nil, # optional, defaults to 'us-east-1'
      #:host => 's3.amazonaws.com', # optional, defaults to nil
      #:endpoint => 'https://s3.amazonaws.com' # optional, defaults to nil
    }

    config.fog_directory = ENV['FOG_DIRECTORY'] # required
    config.fog_public = true # optional, defaults to true
    #config.fog_attributes = {'Cache-Control' => 'max-age=315576000'} # optional, defaults to {}
    config.asset_host = ENV['CDN_URL']

    # Heroku carrierwave fix
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end

if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end
