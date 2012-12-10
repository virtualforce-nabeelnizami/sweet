class Gesture < ActiveRecord::Base
  attr_accessible :gesture_img, :gesture_msg, :gesture_name
  has_many :messages
  belongs_to :ansgesture ,:class_name => "Gesture", :foreign_key => "reply_id"
#  has_many :messages ,:through => :messages , :dependent => :destroy
end
