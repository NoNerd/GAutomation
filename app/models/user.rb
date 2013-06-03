class User < ActiveRecord::Base
  attr_accessible :password, :position, :username
end
