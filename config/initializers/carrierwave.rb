CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                       
    config.fog_credentials = {
      provider:              'AWS',                       
      aws_access_key_id:     ENV['AWS_ACCESS_KEY'],                        
      aws_secret_access_key: ENV['AWS_SECRET_KEY'],
      region: 'sa-east-1'
    }
    config.storage = :fog
    
    case Rails.env
        when 'production'
            config.fog_directory = 'lospets-files-prod'
            config.asset_host = 'https://s3.amazonaws.com/lospets-files-prod'
    
        when 'development'
            config.fog_directory = 'lospets-files'
            config.asset_host = 'https://s3.amazonaws.com/lospets-files'
    end
end