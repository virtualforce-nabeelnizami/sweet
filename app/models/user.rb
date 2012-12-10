class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  attr_accessible :email, :first_name, :last_name, :password,:password_confirmation, :remember_me
  has_many :messages
  has_many :friends, :through => :friendships
  has_many :friendships, :dependent => :destroy

    def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)

    data=access_token.extra.raw_info

    if user=User.where(:email=>data.email).first

      user

    else

      #Create a user with a stub password.

      User.create!(:email=>data .email, :password=>Devise.friendly_token[0,20])

    end

  end




  #  def fullname
  #  [first_name, last_name].reject{|v| v.blank?}.join(" ")
  #end
  #  attr_accessor :password
  #  before_save :encrypt_password
  #
  #  validates_confirmation_of :password
  #  validates_presence_of :password, :on => :create
  #  validates_presence_of :email
  #  validates_uniqueness_of :email
  #  def self.authenticate(email, password)
  #    user = find_by_email(email)
  #    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  #      user
  #    else
  #      nil
  #    end
  #  end
  #def encrypt_password
  #    if password.present?
  #      self.password_salt = BCrypt::Engine.generate_salt
  #      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #    end
  #  end
end
