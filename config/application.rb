require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
Dotenv::Railtie.load unless Rails.env.production?

module PaperclipBase64
  class Application < Rails::Application
    config.load_defaults 5.1
    config.generators.system_tests = nil
    config.paperclip_defaults = {
      storage: :s3,
      url: ':s3_domain_url',
      path: ':class/:attachment/:id_partition/:style/:filename',
      s3_region: ENV['AWS_REGION'],
      s3_host_name: ENV['S3_HOST_NAME'],
      s3_protocol: :https,
      s3_credentials: {
        bucket: ENV['S3_BUCKET_NAME'],
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      }
    }
  end
end
