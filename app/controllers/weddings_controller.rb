class WeddingsController < ApplicationController

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

  private
  def allowed_params
    params.require(:wedding).permit(:title, :wedding_date)
  end

end
