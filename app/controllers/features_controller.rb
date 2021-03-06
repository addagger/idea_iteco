class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  def index
    @features = Feature.all
    respond_with(@features)
  end

  def show
    respond_with(@feature)
  end

  def new
    @feature = Feature.new
    respond_with(@feature)
  end

  def edit
  end

  def create
    @feature = Feature.new(feature_params)
    @feature.save
    respond_with(@feature)
  end

  def update
    @feature.update(feature_params)
    respond_with(@feature)
  end

  def destroy
    @feature.destroy
    respond_with(@feature)
  end

  private
    def set_feature
      @feature = Feature.find(params[:id])
    end

    def feature_params
      params.require(:feature).permit(:project_id, :name, :description, :icon, :position)
    end
end
