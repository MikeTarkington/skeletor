require 'bcrypt'

class User < ActiveRecord::Base
  # associations

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    @user && @user.password == password ? @user : nil
  end

end
