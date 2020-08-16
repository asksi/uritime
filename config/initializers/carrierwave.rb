# unless Rails.env.development? || Rails.env.test?
#   CarrierWave.configure do |config|
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: 'AKIARZXGM6K3G2VE537K',
#       aws_secret_access_key: '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',
#       region: 'Tokyo'
#     }

#     config.fog_directory  = 'uritime-first-bucket'
#     config.cache_storage = :fog
#   end
# end