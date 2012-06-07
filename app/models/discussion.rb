class Discussion < ActiveRecord::Base
  attr_accessible :name
  belongs_to :subject, polymorphic: true
  belongs_to :user
end
