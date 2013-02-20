class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password,
    :password_confirmation, :user_type
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :user_type
  validates_uniqueness_of :email
  has_secure_password

  def self.user_types
    [["Super", "super"], ["Admin", "admin"], ["Normal", "normal"]]
  end

  #Check User type
  def is_super?
    if self.user_type == 'super' 
      return true
    else
      return false
    end
  end

  def is_admin?
    if self.user_type == 'admin' 
      return true
    else
      return false
    end    
  end

  def is_normal?
    if self.user_type == 'Normal' 
      return true
    else
      return false
    end 
  end

  def update_user_type(user_type)
    if user_type == ""
      user_type="normal"
    end
    self.update_attributes(user_type: user_type)
  end
end
