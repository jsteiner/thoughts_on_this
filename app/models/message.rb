class Message < ActiveRecord::Base
  belongs_to :discussion
  attr_accessible :user_name, :content

  # TODO: This probably doesn't belong here
  def render
    "<li><strong>#{user_name}:</strong> #{content}</li>"
  end
end
