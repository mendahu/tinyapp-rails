class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    short_url = params[:short_url]
    @url = Url.find_by(short_url: short_url)
  end
end
