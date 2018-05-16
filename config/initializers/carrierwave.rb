require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                       
    config.fog_credentials = {
      provider:              'AWS',                       
      aws_access_key_id:     ENV['AWS_ACCESS_KEY'],                        
      aws_secret_access_key: ENV['AWS_SECRET_KEY'],
      region: 'sa-east-1'
    }
    config.fog_public = true                                     
    
    case Rails.env
        when 'production'
            config.fog_directory = 'prod'
            config.asset_host = 'https://s3-sa-east-1.amazonaws.com/lospets-files/img/prod'
    
        when 'development'
            config.fog_directory = 'dev'
            config.asset_host = 'https://s3-sa-east-1.amazonaws.com/lospets-files/img/dev'
    end
end