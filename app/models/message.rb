class Message < ActiveRecord::Base
  belongs_to :discussion
  attr_accessible :user_name, :content

  validates :content, presence: true
  validates :discussion, presence: true

  after_create :touch_discussion

  private

  def touch_discussion
    discussion.touch
  end
end
