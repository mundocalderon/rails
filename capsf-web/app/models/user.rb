class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  
  def admin?
    if self.role == "Admin" || self.role == "SuperAdmin"
      true
    end  
  end
  
  def super_admin?
    if self.role == "SuperAdmin"
      true
    end
  end
  
end
