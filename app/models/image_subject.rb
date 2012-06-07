class ImageSubject < ActiveRecord::Base
  attr_accessible :image
  has_one :discussion, as: :subject
  accepts_nested_attributes_for :discussion
  has_attached_file :image

  validates_attachment :image, presence: true,
                       content_type: { content_type: ['image/jpeg', 'image/png', 'image/gif'] },
                       size: { less_than: 2.megabytes }
end
