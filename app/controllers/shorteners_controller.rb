class ShortenersController < ApplicationController
  def index
    @shortener = Shortener.new
    @shorteners = Shortener.all
  end

  def show
    @shortener = Shortener.find(params[:id])
    redirect_to @shortener.url
  end

  def new
  end

  def create
    @shortener = Shortener.new(params[:shortener])
    @shortener.shortener
    redirect_to shorteners_path if @shortener.save
  end

  def destroy
  end
end
