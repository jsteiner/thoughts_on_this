require 'spec_helper'

describe Guest do
  context '#has_name?' do
    it 'returns true if the guest has a name' do
      guest = Guest.new('Joe', 'Shmoe')
      guest.has_name?.should be_true
    end

    it 'returns false if the guest does not have a name' do
      guest = Guest.new
      guest.has_name?.should be_false
    end
  end
end
