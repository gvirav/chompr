class ShortenersController < ApplicationController
  def index
    @shorteners = Shortener.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
