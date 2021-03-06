# config/initializers/koala.rb
# Simple approach

module Facebook
  CONFIG = YAML.load_file(Rails.root.join('config/secrets.yml'))[Rails.env]
  APP_ID = CONFIG['facebook_app_id']
  SECRET = CONFIG['facebook_secret_key']
end

Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    raise 'application id and/or secret are not specified in the environment' unless ENV['FB_APP_ID'] && ENV['FB_SECRET_KEY']
    initialize_without_default_settings(ENV['FB_APP_ID'].to_s, ENV['FB_SECRET_KEY'].to_s, args.first)
  end

  alias_method_chain :initialize, :default_settings
end