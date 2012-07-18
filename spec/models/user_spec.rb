require 'spec_helper'

describe User do
  it { should have_many(:discussions).dependent(:destroy) }
  it { should allow_mass_assignment_of(:name) }

  context '#discussion_timeline' do
    it 'returns their discussions with most recently updated first' do
      user = build_stubbed(:user)
      oldest_discussion = create(:discussion, :text, user: user)
      middle_discussion = create(:discussion, :text, user: user)
      newest_discussion = create(:discussion, :text, user: user)

      middle_discussion.touch
      user.discussion_timeline.should == [middle_discussion, newest_discussion, oldest_discussion]
    end
  end

  context '#has_name?' do
    it 'returns true if the user has a name' do
      user = build(:user, :with_name)
      user.should have_name
    end

    it 'returns false if the user does not have a name' do
      user = build(:user)
      user.should_not have_name
    end
  end
end
