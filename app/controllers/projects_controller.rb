class ProjectsController < ApplicationController
  before_action :set_user, except: [:destroy]
  before_action :set_project, except: [:index, :new, :create]

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
    redirect_to project_path(@project)
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :user_id, :due_date, :status)
  end
end
