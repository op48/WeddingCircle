class UsersController < ApplicationController
  #before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
  end

  # def me
  #   sign_in(User.find(params[:id]))
  #   render :show
  # end
  
  def authorise_facebook#get oauth token
    #binding.pry
    redirect_to facebook_oauth_client.auth_code.authorize_url(
      :redirect_uri => facebook_oauth_callback_url,
      :scope => %w(email user_events user_groups).join(","))

  end

  def facebook_oauth_callback#gives you oautho token
    #binding.pry
    access_token = facebook_oauth_client.auth_code.get_token(params[:code],#gets access token
    :redirect_uri => facebook_oauth_callback_url,
    :parse => :query
    )
 
    # TODO
    # 1. Get user info from user using the access token
    user_info = JSON(access_token.get('https://graph.facebook.com/me').body).symbolize_keys
    # 2.Find/create a user model based on the github id  
    #github_id = user_info[:id]

    @user = User.find_or_initialize_by(
      :facebook_id => user_info[:id],
      :first_name => user_info[:first_name],
      :email => user_info[:email]
      )

    #3.set the access token on the User model and save it
    @user.access_token = access_token.token #access_token is a column in the database
    @user.provider = "facebook"
    @user.save!
    
    sign_in(@user)
    #4. Redirect somewhere else and say tht we're logged in
    redirect_to user_path(@user)
    #sign_in_and_redirect(@user)
  end

  private
  def facebook_oauth_client#config client and end 
    @facebook_oauth_client ||= OAuth2::Client.new(
    WeddingCircle::Application.config.facebook_application_id,
    WeddingCircle::Application.config.facebook_secret,
     :site => "https://graph.facebook.com/",
     :token_url => "/oauth/access_token"
    )
  end

end
