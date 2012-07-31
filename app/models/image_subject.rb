class ImageSubject < ActiveRecord::Base
  attr_accessible :image

  belongs_to :user
  has_one :discussion, as: :subject
  has_attached_file :image

  accepts_nested_attributes_for :discussion


  validates_attachment :image, presence: true,
                       content_type: { content_type: ['image/jpeg', 'image/png', 'image/gif'] },
                       size: { less_than: 2.megabytes }
end
