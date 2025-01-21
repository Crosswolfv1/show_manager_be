class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show

  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private


end
