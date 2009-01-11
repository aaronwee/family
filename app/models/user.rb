require 'digest/sha1'

class User < ActiveRecord::Base
  def self.authenticate(username, password)
    !User.find_by_login_and_password(username, Digest::SHA1.hexdigest(password)).nil?
  end

  def password=(str)
    write_attribute("password", Digest::SHA1.hexdigest(str))
  end

  def password
    "********"
  end
end
