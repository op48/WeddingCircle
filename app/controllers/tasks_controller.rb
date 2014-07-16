class TasksController < ApplicationController
  before_filter :authenticate_user!, :except => [:authorise_facebook, :facebook_oauth_callback] 
  before_filter :load_all_task, :only => :index
  
  def new
    @user = current_user
    @task = Task.new
  end 

  def create
    @user = current_user
    @task = Task.new(allowed_params)
    @task.save!
    respond_to do |format|
      format.html {redirect_to tasks_path}
    end
  end

  def index
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id]) 
  end

  def update
    @task = Task.find(params[:id])
    @task.update(allowed_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def allowed_params
    params.require(:task).permit(:wedding_id, :title, :task_details, :date_time_due, :location)
  end

  def load_all_task
    @tasks = Task.all
  end

end
