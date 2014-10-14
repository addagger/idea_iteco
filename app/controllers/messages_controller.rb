class MessagesController < ApplicationController
#  before_action :set_message, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  load_and_authorize_resource
  
  def index
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    respond_with(@message)
  end

  def edit
  end

  def create
    respond_with(@resource, @message) do |format|
      if @message.save
        flash[:notice] = 'Спасибо! Ваше сообщение отправлено.'
        format.html { redirect_to root_path }
        format.js { render :js => "window.location = '#{root_path}';"}
      else
        flash.now[:alert] = "#{@message.errors.full_messages.join("<br>")}"
        format.html { render action: "new" }
        format.js { }
      end
    end
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    # def set_message
    #   @message = Message.find(params[:id])
    # end

    def message_params
      params.require(:message).permit(:person_name, :person_email, :person_phone_code, :person_phone_number, :content)
    end
end
