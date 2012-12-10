class MessagesController < ApplicationController
  autocomplete :user, :email, :full => true
  def new
    @message = Message.new
    respond_to do |format|
      format.html { render :partial => "/messages/new" }
      format.js
    end
  end
  def create
    @frnd = User.find_by_email(params[:user][:email])
    #      puts "_____________ #{@frnd.blank?}-- #{@frnd.nil?}"
    if @frnd.nil?
      #        puts "_______(((______ #{@frnd.blank?}-- #{@frnd.nil?}"
      @frnd=User.new(params[:user])
      @frnd.save(:validate=>false)
    end
    message = Message.create(:content => params[:message][:content], :gesture_id => params[:gesture_id], :user_id =>  current_user.id , :frm_id => @frnd.id)
#    @gesture = Gesture.find(params[:id])
    UserMailer.welcome_email(@frnd,message).deliver
    @friendship = Friendship.find_or_create_by_user_id_and_friend_id(current_user.id, @frnd.id)
    @friendship = Friendship.find_or_create_by_user_id_and_friend_id(@frnd.id,current_user.id)
    @friendship = current_user.friends.order("created_at ASC")
    @mesg = Message.where(:frm_id => current_user.id)
#    @message = Message.where(:frm_id => current_user.id)
    render :partial => "/home/index", notice => 'Gesture has been successfully sent.'
  end
  def reply
    @message = Message.find_by_id(params[:id].to_i)

     if request.post?
    message = Message.create(:content => params[:message][:content], :gesture_id => params[:gesture_id], :user_id =>  current_user.id , :frm_id => params[:user_frm.id])
    @friendship = current_user.friends.order("created_at ASC")
#      render :partial => "/home/index", notice => 'Gesture Reply has been successfully sent.'
     end
     respond_to do |format|
      format.html { render :partial => "/messages/reply" }
      format.js
    end
  end
  def show
    @message = current_user.messages
    respond_to do |format|
      format.html { render :partial => "/messages/show" }
      format.js
    end

  end

end
