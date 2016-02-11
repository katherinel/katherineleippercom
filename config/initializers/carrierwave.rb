CarrierWave.configure do |config|
  #config.root = Rails.root.join('tmp') # adding these...
  #config.cache_dir = 'carrierwave' # ...two lines
  if Rails.env.development?
    config.storage = :file
  elsif Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
    #config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']                     # required
      #:region                 => 'us-west-1',                  # optional, defaults to 'us-east-1'
      #:host                   => 's3.example.com',             # optional, defaults to nil
      #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.cache_dir        = "#{Rails.root}/tmp/uploads"
    config.fog_directory  = ENV['S3_BUCKET_NAME']                             # required
    config.fog_public     = false                                   # optional, defaults to true
    #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end