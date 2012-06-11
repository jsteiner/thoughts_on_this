class Discussion < ActiveRecord::Base
  attr_accessible :name
  belongs_to :subject, polymorphic: true
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates_presence_of :user_id, :name
  validates_associated :subject

  def self.persisted
    where('id is not null')
  end

  def ordered_messages
    messages.order('created_at ASC')
  end
end
