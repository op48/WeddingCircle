class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:authorise_facebook, :facebook_oauth_callback] 
  
  def show
    @user = current_user
  end
 
  def authorise_facebook
    redirect_to facebook_oauth_client.auth_code.authorize_url(
      :redirect_uri => facebook_oauth_callback_url,
      :scope => %w(email).join(","))
  end

  def facebook_oauth_callback
    access_token = facebook_oauth_client.auth_code.get_token(params[:code],
    :redirect_uri => facebook_oauth_callback_url,
    :parse => :query
    )
 
    user_info = JSON(access_token.get('https://graph.facebook.com/me').body).symbolize_keys

    @user = User.find_or_initialize_by(
      :facebook_id => user_info[:id],
      :first_name => user_info[:first_name],
      :last_name => user_info[:last_name],
      :email => user_info[:email]
      )

    @user.access_token = access_token.token 
    @user.provider = "facebook"
    @user.save!
    
    sign_in(@user)
    
    redirect_to user_path
    
  end

  private
  def facebook_oauth_client
    @facebook_oauth_client ||= OAuth2::Client.new(
    WeddingCircle::Application.config.facebook_application_id,
    WeddingCircle::Application.config.facebook_secret,
     :site => "https://graph.facebook.com/",
     :token_url => "/oauth/access_token"
    )
  end

end
