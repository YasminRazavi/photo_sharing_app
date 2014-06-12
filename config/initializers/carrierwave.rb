CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => '<AKIAIRKFF4GMCYSGNQYQ>',      # required
    :aws_secret_access_key  => '<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>',        # required
    :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = '<collect-photo>'               # required
  config.fog_public     = true                               # optional, defaults to true
end