class RolesController < ApplicationController
  before_filter :authenticate_user!, :except => [:authorise_facebook, :facebook_oauth_callback]

  def index
    #binding.pry
    @user = current_user
    @wedding = Wedding.find(params[:wedding_id])
    @roles = @wedding.roles
    @role = Role.new(:wedding => @wedding)
  end 

  def create
    #binding.pry
    @user = current_user
    @role = Role.create!(allowed_params)  
    redirect_to wedding_roles_path
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to wedding_roles_path
  end

  private
  def allowed_params
    params.require(:role).permit(:title, :user_id, :role_description, :wedding_id)
  end



end
