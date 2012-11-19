class ShortenersController < ApplicationController
  # before_filter :login_required

  def index
    @shortener = Shortener.new
    if logged_in?
      @shorteners = current_user.shorteners
    else
      @shorteners = Shortener.recent
    end
  end

  def show
    @shortener = Shortener.find_by_short_url(params[:short_url])
    @shortener.incrementer
    @shortener.save
    redirect_to @shortener.url
  end

  def edit
    @shortener = Shortener.find(params[:id])
  end

  def create
    shortener_params = params[:shortener]
    shortener_params[:user_id] = current_user.id
    @shortener = Shortener.new(shortener_params) 
    @shortener.shortener
    if @shortener.save
      redirect_to shorteners_path 
    else
      flash[:notice] = "Please log in or sign up!"
      redirect_to shorteners_path
    end
  end

end