require 'spec_helper'

describe ImageSubject do
  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/jpeg', 'image/png', 'image/gif').
                rejecting('video/mp4') }
  it { should validate_attachment_size(:image).less_than(2.megabytes) }
end
