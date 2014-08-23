if File.exist? "#{Rails.root}/config/oauth.yml"

  pass = YAML.load_file(File.open("#{Rails.root}/config/oauth.yml"))[Rails.env]
  
  WeddingCircle::Application.configure do
    config.facebook_application_id = pass["facebook_application_id"] || ENV['facebook_application_id']
    config.facebook_secret = pass["facebook_secret"] || ENV['facebook_secret']
  end

end

