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

  def new
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
      flash[:error] = "Invalid URL! URL must begin with http:// or https://"
      redirect_to shorteners_path
    end
  end

  def destroy
  end

  # def update
  #   @shortener = Shortener.find(params[:visit_count])
  #   respond_to do |format|
  #     if @shortener.update_attributes("visit_count", @shortener.visit_count + 1)
  #       format.html { redirect_to shorteners_path }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @shortener.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
end
