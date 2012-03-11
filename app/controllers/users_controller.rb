class UsersController < ApplicationController
  
  before_filter :admin_user, :only => [:index, :show, :edit, :update, :destroy]
  
  
  def new
    @user = User.new
    @title = "Sign Up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Signed up!"
      
    else
      render "new"
    end
  end
  
  def index
      @users = User.all(:order => "created_at DESC")
      @title ="Listing users"
  end
  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, :notice => "User #{@user.email} has been deleted"}
      format.json { head :ok }
  end
end

private 

def admin_user

  redirect_to root_url, :alert => "You can't access this page!" unless current_user && current_user.admin?
end


end
