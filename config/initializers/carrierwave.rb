# frozen_string_literal: true

CarrierWave.configure do |config|
  if ENV["USE_AWS_S3_STORAGE"].present?
    config.storage = :aws
    config.aws_acl = "private"
    config.aws_authenticated_url_expiration = 1.day.to_i
    config.aws_attributes = {
      expires: 1.day.from_now.httpdate,
      cache_control: "max-age=#{1.day.to_i}",
      server_side_encryption: "AES256"
    }

    config.aws_bucket = ENV.fetch("S3_BUCKET")
    config.aws_credentials = {
      access_key_id:     ENV.fetch("S3_KEY_ID"),
      secret_access_key: ENV.fetch("S3_ACCESS_KEY"),
      region:            ENV.fetch("S3_REGION")
    }
  else
    config.storage = :file
  end
end
