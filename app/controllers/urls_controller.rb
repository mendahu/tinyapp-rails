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
    @url = Url.new
    @url.short_url = SecureRandom.hex(3)
    @url.long_url = params[:url][:long_url]

    if @url.save
      redirect_to @url
    else
      render :new
    end
  end
end
