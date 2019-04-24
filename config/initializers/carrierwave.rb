CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    # アクセスキー
    aws_access_key_id:     'AKIAZZRRDOCWENAC4AUF',
    # シークレットキー
    aws_secret_access_key: 'Whg9j5ZaYfVlGfASX6KJhL6sUpJuHMNlUEcLVyUU',
    # Tokyo
    region:                'ap-northeast-1',
  }

  config.fog_directory  = 'aspecwork-image'
  config.cache_storage = :fog
end

# 日本語ファイル名の設定
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
