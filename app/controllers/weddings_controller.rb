class WeddingsController < ApplicationController
  before_filter :authenticate_user!, :except => [:authorise_facebook, :facebook_oauth_callback] 
  
  def new
    @user = current_user
    @wedding = Wedding.new
    @wedding.roles.build  
  end

  def create
    @user = current_user
    @wedding = Wedding.new(allowed_params)
    @wedding.save!
    redirect_to wedding_path(@wedding)
  end

  def index
    @wedding = Wedding.all
  end

  def show
    @wedding = Wedding.find(params[:id])
  end

  def edit
    @wedding = Wedding.find(params[:id])
  end

  def update
    @wedding = Wedding.find(params[:id])
    @wedding.update(allowed_params)
    redirect_to wedding_path
  end

  def destroy
    @wedding = Wedding.find(params[:id])
    @wedding.destroy
    redirect_to user_path
  end 

  private
  def allowed_params
    params.require(:wedding).permit(:id, :title, :wedding_date, {roles_attributes: [:id, :title, :user_id, :role_description]})
  end

end
