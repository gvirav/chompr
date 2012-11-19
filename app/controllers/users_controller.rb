class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to shorteners_path, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
      flash[:error] = "Invalid Username or Password (Password must be at least 4 characters)"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to shorteners_path, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
end
