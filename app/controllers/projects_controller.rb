class ProjectsController < ApplicationController
  before_action :set_user, except: [:destroy]

  def index
    @projects = @user.projects
    @project = Project.new
  end

  def new

  end

  def create
    @project = Project.create(project_params)
    redirect_to projects_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_user
    @user = current_user
  end

  def project_params
    params.require(:project).permit(:name, :description, :user_id, :due_date, :status)
  end
end
