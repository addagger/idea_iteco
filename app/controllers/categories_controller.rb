class CategoriesController < ApplicationController
  # before_action :set_category, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  load_and_authorize_resource :find_by => :permalink
  
  def index
    respond_with(@categories)
  end

  def show
    if @category.ready? || can?(:manage, Category)
      respond_with(@category)
    else
      flash.now[:alert] = "Извините, на данный момент не все проекты доступны в открытом доступе..."
      redirect_to :back
    end
  end

  def new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    # def set_category
    #   @category = Category.find(params[:id])
    # end

    def category_params
      params.require(:category).permit(:title, :description, :permalink, :icon, {:html_doc_attributes => [:content]}, :published)
    end
end
