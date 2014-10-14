class IdeasController < ApplicationController
  # before_action :set_idea, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # load_and_authorize_resource :category, :find_by => :permalink
  # load_and_authorize_resource :group, :find_by => :permalink
  # load_and_authorize_resource :project, :find_by => :permalink
  load_and_authorize_resource :through => [:category, :group, :project], :shallow => true, :find_by => :token
  before_filter :resource
  
  def resource
    @resource = [@category, @group, @project].compact.last
  end
  
  def index
    respond_with(@resource, @ideas)
  end

  def show
    respond_with(@resource, @idea)
  end

  def new
    respond_with(@resource, @idea)
  end

  def edit
  end

  def create
    respond_with(@resource, @idea) do |format|
      if @idea.save
        flash[:notice] = 'Спасибо! Ваша информация внесена в нашу базу и обязательно будет рассмотрена.'
        format.html { redirect_to root_path }
        format.js { redirect_to root_path }
      else
        format.html { render action: "new" }
        format.js { }
      end
    end
  end

  def update
    @idea.update(idea_params)
    respond_with(@resource, @idea)
  end

  def destroy
    @idea.destroy
    respond_with(@resource, @idea)
  end

  private
    # def set_idea
    #   @idea = Idea.find(params[:id])
    # end

    def idea_params
      params.require(:idea).permit(:title, :details, :person_name, :person_email, :person_phone_code, :person_phone_number, {:category_ids => []}, {:group_ids => []}, {:project_ids => []}, :tags)
    end
end
