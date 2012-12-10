class UsersController < ApplicationController
 autocomplete :user, :email, :full => true
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        
        format.html { redirect_to('/log_in', :notice => 'User was successfully created.') }
#        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
