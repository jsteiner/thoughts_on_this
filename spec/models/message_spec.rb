require 'spec_helper'

describe Message do
  it { should belong_to(:discussion) }
  it { should allow_mass_assignment_of(:user_name) }
  it { should allow_mass_assignment_of(:content) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:discussion) }

  context '#user_number' do
    it 'should call #user_number on discussion with the approriate user_name' do
      discussion = build_stubbed(:discussion, :text)
      message = build(:message, discussion: discussion)
      discussion.stubs(:user_number)
      message.user_number
      discussion.should have_received(:user_number).with(message.user_name)
    end
  end

  context '#touch_discussion' do
    it 'should update discussion when a new message is created' do
      discussion = build_stubbed(:discussion, :text)
      message = build(:message, discussion: discussion)
      discussion.stubs(:touch)
      message.save
      discussion.should have_received(:touch)
    end
  end
end
