require 'spec_helper'

describe ImageSubject do
  it { should have_one(:discussion) }
  it { should belong_to(:user) }
  it { should allow_mass_assignment_of(:image) }
  it { should accept_nested_attributes_for(:discussion) }

  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/jpeg', 'image/png', 'image/gif').
                rejecting('video/mp4') }
  it { should validate_attachment_size(:image).less_than(2.megabytes) }
end
