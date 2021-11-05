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
    @url.short_url = url_generator

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
  
  #Used recursion to make sure that each url is unique 
  def url_generator
    url = "g.et/"
    url << "#{random_characters}" 
    Url.where(short_url: url).exists? ? url_generator : url
  end

  #Made a random string method to have an alphanumeric string 
  #rather than just a numeric or alphabet based string for the url 
  def random_characters
    charset = Array('0'..'9') + Array('a'..'z')
    Array.new(6) { charset.sample }.join
  end

  def url_params
    params.require(:url).permit(:long_url)
  end
end
