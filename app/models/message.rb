class Message < ActiveRecord::Base
  belongs_to :discussion
  attr_accessible :user_name, :content

  validates :content, presence: true
  validates :discussion, presence: true

  after_create :touch_discussion

  def user_number
    discussion.user_number(user_name).try(:+, 1)
  end

  private

  def touch_discussion
    discussion.touch
  end
end
