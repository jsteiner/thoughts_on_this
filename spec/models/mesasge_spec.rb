require 'spec_helper'

describe Message do
  it { should belong_to(:discussion) }
  it { should allow_mass_assignment_of(:user_name) }
  it { should allow_mass_assignment_of(:content) }
end
