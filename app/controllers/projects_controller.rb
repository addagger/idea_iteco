class ProjectsController < ApplicationController
  # before_action :set_project, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  load_and_authorize_resource :find_by => :permalink

  def index
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    # def set_project
    #   @project = Project.find(params[:id])
    # end

    def project_params
      params.require(:project).permit(:title, :description, :permalink, {:category_ids => []}, {:group_ids => []}, {:html_doc_attributes => [:content]}, :tags, :published)
    end
end
