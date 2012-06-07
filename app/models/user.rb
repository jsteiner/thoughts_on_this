class User < ActiveRecord::Base
  include Clearance::User
  has_many :discussions # TODO: dependent: destroy
end
