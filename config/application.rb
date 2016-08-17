require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBlog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.paperclip_defaults = { storage: :s3, s3_credentials: { bucket: "staging-factory-consumer-payments", access_key_id: "AKIAIJ34YPTERI546J6A", secret_access_key: "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"}, s3_region: "ap-southeast-1", s3_host_name: "s3.amazonaws.com", s3_protocol: 'http', url: ":s3_domain_url", path: "/:class/:attachment/:id_partition/:style/:filename"}
  end
end
