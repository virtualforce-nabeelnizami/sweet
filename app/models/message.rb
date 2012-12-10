class Message < ActiveRecord::Base
  attr_accessible :content, :is_read,:gesture_id, :user_id, :frm_id
  belongs_to :user 
  belongs_to :user_frm ,:class_name => "User", :foreign_key => "frm_id"
  belongs_to :gesture
  belongs_to :ansgesture ,:class_name => "Ges", :foreign_key => "reply_id"

end
