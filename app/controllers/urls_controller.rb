class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by(short_url: params[:id])
  end

  def new
  end
end
