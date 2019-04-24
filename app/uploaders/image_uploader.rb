class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

    storage :fog

    def default_url
      '/public/default.png'
    end

    # S3のディレクトリ名
    def store_dir
      "#{model.user.username}/#{model.date.year}/#{model.date.month}/#{mounted_as}"
    end

      process resize_to_fill: [640, 450]

    # 許可する画像の拡張子
    def extension_whitelist
      %w(jpg jpeg gif png)
    end

    # 保存するファイルの命名規則
    def filename
       "#{model.date.day}.#{file.extension}" if original_filename.present?
    end

    # 一意となるトークンを作成
    protected

    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end
end
