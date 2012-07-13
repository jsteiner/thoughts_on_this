require 'spec_helper'

describe User do
  it { should have_many(:discussions).dependent(:destroy) }
  it { should allow_mass_assignment_of(:first_name) }
  it { should allow_mass_assignment_of(:last_name) }

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

  context '#full_name' do
    it 'returns their first name and last name' do
      user = build(:user, :with_name)
      user.full_name.should == "#{user.first_name} #{user.last_name}"
    end

    it "returns nil if they don't have a first and last name" do
      user = build(:user, first_name: nil, last_name: 'Smith')
      user.full_name.should be_nil
    end
  end

  context '#has_full_name?' do
    it 'returns true if the user has a name' do
      user = build(:user, :with_name)
      user.has_full_name?.should be_true
    end

    it 'returns false if the user does not have a name' do
      user = build(:user)
      user.has_full_name?.should be_false
    end
  end
end
