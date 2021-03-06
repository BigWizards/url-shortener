class UrlsController < ApplicationController
  before_action :set_event, only: :show 

  def home
    @url = Url.new
  end

  def index
  end

  def show
  end

  def create
    @url = Url.new(url_params)
    @url.short_url = Url.url_generator

    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: "Here is your new url." }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :home, status: :unprocessable_entity }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_event
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:long_url)
  end
end
