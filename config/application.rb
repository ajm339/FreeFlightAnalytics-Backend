require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EagleEyeAnalyticsBackend
  class Application < Rails::Application
    ENV['aws_access_key_id']='AKIAJ2ZWU74X43EVFIAQ'
    ENV['aws_secret_access_key']='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'
    ENV['aws_bucket']='freeflightanalytics'
  end
end
