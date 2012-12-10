class HomeController < ApplicationController
  def index
#    @user = User.all()
    unless current_user.nil?
      @friendship = current_user.friends.order("created_at ASC")
      @message = Message.where(:user_id => current_user.id)
      @mesg = Message.where(:frm_id => current_user.id)
    end
    
  end
end

