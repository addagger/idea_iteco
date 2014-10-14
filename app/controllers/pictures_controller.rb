class PicturesController < ApplicationController
  # before_action :set_picture, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource :category, :find_by => :permalink
  load_and_authorize_resource :group, :find_by => :permalink
  load_and_authorize_resource :project, :find_by => :permalink
  
  before_filter :resource
  load_and_authorize_resource :through => [:category, :group, :project], :shallow => true, :except => :index

  def resource
    @resource = [@category, @group, @project].compact.last
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/1/edit
  def edit
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to [@resource, @picture], notice: t('picture.flash.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to [@resource, Upload.new], notice: t('picture.flash.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_picture
    #   @picture = Picture.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:src, :description, :crop_x, :crop_y, :crop_w, :crop_h, :multiple_src => [])
    end
end