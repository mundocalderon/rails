class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username, :first_name, :last_name, :role

  attr_accessor :password
  before_save :encrypt_password
  after_save :clear_password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create


  def self.authenticate(username_or_email="", login_password="")
    if EMAIL_REGEX.match(username_or_email)
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    crypted_password == BCrypt::Engine.hash_secret(login_password, password_salt)
  end
    
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.crypted_password = BCrypt::Engine.hash_secret(password,password_salt)
    end
  end

  def clear_password
   # commented out so that the email sent to sitemaster contains user's login information.
   # self.password = nil
  end  
  
end
