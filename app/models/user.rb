class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password,
    :password_confirmation
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email
  has_secure_password
end
