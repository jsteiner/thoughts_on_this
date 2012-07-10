require 'spec_helper'

describe Message do
  it { should belong_to(:discussion) }
  it { should allow_mass_assignment_of(:user_name) }
  it { should allow_mass_assignment_of(:content) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:discussion) }

  context '#touch_discussion' do
    it 'should update discussion when a new message is created' do
      discussion = create(:discussion, :text)
      message = build(:message, discussion: discussion)
      discussion.stubs(:touch)
      message.save
      discussion.should have_received(:touch)
    end
  end
end
