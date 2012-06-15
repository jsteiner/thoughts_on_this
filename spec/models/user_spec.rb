require 'spec_helper'

describe User do
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

  context '#destroy' do
    it "also destroys the user's discussions" do
      user = create(:user)
      discussion = create(:discussion, :image, user: user)
      Discussion.all.should have(1).item
      user.destroy
      Discussion.all.should have(0).items
    end
  end
end
