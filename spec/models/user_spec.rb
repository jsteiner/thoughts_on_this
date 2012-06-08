require 'spec_helper'

describe User do
  context '#full_name' do
    it 'returns their first name and last name' do
      user = create(:user, :with_name)
      user.full_name.should == "#{user.first_name} #{user.last_name}"
    end
  end

  context '#has_name?' do
    it 'returns true if the user has a name' do
      user = create(:user, :with_name)
      user.has_name?.should be_true
    end

    it 'returns false if the user does not have a name' do
      user = create(:user)
      user.has_name?.should be_false
    end
  end
end
