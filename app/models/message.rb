class Message < ActiveRecord::Base
  belongs_to :discussion
  attr_accessible :user_name, :content
end
