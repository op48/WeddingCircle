WeddingCircle::Application.configure do
  path = "#{Rails.root}/config/oauth.yml"
  secrets = File.exist?(path) ? YAML.load_file(File.open(path))[Rails.env] : ENV

  config.facebook_application_id = secrets['facebook_application_id']
  config.facebook_secret = secrets['facebook_secret']
end 