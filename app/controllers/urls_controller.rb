require 'securerandom'

class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by(short_url: params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    short_url = SecureRandom.hex(3)
    user_id = 1
    @url = Url.new(url_params.merge(short_url: short_url, user_id: user_id))

    if @url.save
      redirect_to @url
    else
      render :new
    end
  end

  def redirect
    @url = Url.find_by(short_url: params[:short_url])
    url = @url.long_url.prepend("https://")
    redirect_to url
  end

  def update
    @url = Url.find_by(short_url: params[:id])

    if @url.update(url_params)
      redirect_to @url
    else
      render :new
    end
  end

  def destroy
    @url = Url.find_by(short_url: params[:id])
    @url.destroy
    redirect_to action: "index"
  end

  private def url_params
    params.require(:url).permit(:long_url)
  end
end
