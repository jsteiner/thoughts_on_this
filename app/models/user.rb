class User < ActiveRecord::Base
  include Clearance::User
  has_many :discussions, dependent: :destroy
  attr_accessible :name

  def discussion_timeline
    discussions.order('updated_at DESC')
  end

  def has_name?
    name.present?
  end
end
