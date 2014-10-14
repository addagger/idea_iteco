class PicasController < ApplicationController
  #before_action :set_logo, only: [:show, :edit, :update, :destroy]

  CLASS_TYPES = [:avatar, :logo, :image, :bg_image]

  load_and_authorize_resource :category, :find_by => :permalink
  load_and_authorize_resource :group, :find_by => :permalink
  load_and_authorize_resource :project, :find_by => :permalink
  load_and_authorize_resource :picture
  before_filter :resource
  before_filter :link_picas_type

  def resource
    @resource = (@category||@group||@project)
  end

  def link_picas_type
    if CLASS_TYPES.find {|a| a.to_s == params[:picas]}
      @reflection = @resource.attached_picture_reflection(params[:picas].classify)
      @picas_name = @reflection.class_name.underscore
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  # POST /logos
  # POST /logos.json
  def create
    if @reflection.collection?
      @resource.send(@reflection.name).find {|picas| picas.picture == @picture}.try(:destroy)
      @picas = @resource.send(@reflection.name).build
    else
      @resource.send(@reflection.name).try(:destroy)
      @picas = @resource.send("build_#{@reflection.name}")
    end
    @picas.picture = @picture
    respond_to do |format|
      if @picas.save
        format.js { }
      else
        format.js { render :js => "alert('Error #{@picture.id}');" }
      end
    end
  end

  # DELETE /logos/1
  # DELETE /logos/1.json
  def destroy
    if @reflection.collection?
      @picas = @resource.send(@reflection.name).find {|picas| picas.picture == @picture}
    else
      @picas = @resource.send(@reflection.name)
    end
    @picas.destroy
    respond_to do |format|
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_logo
    #   @logo = Logo.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logo_params
      params.require(:picas).permit()
    end
end