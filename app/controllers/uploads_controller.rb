class UploadsController < ApplicationController
  # before_action :set_upload, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource :category, :find_by => :permalink
  load_and_authorize_resource :group, :find_by => :permalink
  load_and_authorize_resource :project, :find_by => :permalink
  
  before_filter :resource
  load_and_authorize_resource :through => [:category, :group, :project], :shallow => true, :except => :index

  def resource
    @resource = [@category, @group, @project].compact.last
  end

  # GET /uploads
  # GET /uploads.json
  def index
    authorize! :read, Upload
    @uploads = (@resource.try(:uploads)||Upload).order("uploads.created_at DESC").accessible_by(current_ability).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {:files => @uploads.map {|upload| upload.to_jq_upload(@resource)}} }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    %w{ Picture }.each do |descendant|
      klass = descendant.constantize
      other = @upload.becomes(klass)
      if other.valid?
        @upload = klass.new(upload_params)
        @upload.resource = @resource
      end
    end
    respond_to do |format|
      if @upload.save
        format.html {
          render :json => [@upload.to_jq_upload(@resource)].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@upload.to_jq_upload(@resource)]}, status: :created, location: @upload }
      else
        format.html { render action: 'new' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to [@resource, @upload], notice: t('upload.flash.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to [@resource, Upload.new], notice: t('upload.flash.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_upload
    #   @upload = Upload.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:src, :description, :origin, :multiple_src => [])
    end
  
end