class UserMailer < ActionMailer::Base
  default :from => "admin@sweet.com"
  def welcome_email(user,message)
    @user = user
    @message = message
#    @gesture = gesture
    @url  = "http://example.com/see_message"
    mail(:to => user.email, :subject => "Message from Sweet Friend", :from => "Sweetness", :content_type => "text/html")
  end
end
