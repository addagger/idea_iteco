class QuotesController < ApplicationController
  # before_action :set_quote, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  load_and_authorize_resource
  
  def index
    respond_with(@quotes)
  end

  def show
    respond_with(@quote)
  end

  def new
    respond_with(@quote)
  end

  def edit
  end

  def create
    @quote.save
    respond_with(@quote)
  end

  def update
    @quote.update(quote_params)
    respond_with(@quote)
  end

  def destroy
    @quote.destroy
    respond_with(@quote)
  end

  private
    # def set_quote
    #   @quote = Quote.find(params[:id])
    # end

    def quote_params
      params.require(:quote).permit(:who, :said, :when, :where)
    end
end
