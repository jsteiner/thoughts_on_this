class Message < ActiveRecord::Base
  belongs_to :discussion
  attr_accessible :user_name, :content

  validates :content, presence: true
  validates :discussion, presence: true

  after_create :touch_discussion

  # TODO: This probably doesn't belong here
  def render
    "<li><strong>#{user_name}:</strong> #{content}</li>"
  end

  private

  def touch_discussion
    discussion.touch
  end
end
