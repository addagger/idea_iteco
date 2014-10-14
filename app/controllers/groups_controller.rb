class GroupsController < ApplicationController
  #before_action :set_group, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  load_and_authorize_resource :find_by => :permalink

  def index
    respond_with(@groups)
  end

  def show
    if @group.ready? || can?(:manage, Group)
      respond_with(@group)
    else
      flash.now[:alert] = "Извините, на данный момент не все проекты доступны в открытом доступе..."
      redirect_to :back
    end
  end

  def new
    respond_with(@group)
  end

  def edit
  end

  def create
    @group.save
    respond_with(@group)
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def destroy
    @group.destroy
    respond_with(@group)
  end

  private
    # def set_group
    #   @group = Group.find(params[:id])
    # end

    def group_params
      params.require(:group).permit(:title, :description, :permalink, :icon, {:html_doc_attributes => [:content]}, :published)
    end
end
