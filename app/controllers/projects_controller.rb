class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created(10)
  end

  def show
    @project = Project.find_by(id: params[:id]) ||
      render_404(params)
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by(id: params[:id]) ||
      render_404(params)
  end

  def create
    @project = Project.new(project_params)

    if @project.valid?
      @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    @project = Project.find_by(id: params[:id])

    if @project.update_attributes(project_params)
      redirect_to projects_path, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :description, :logo)
  end
end
