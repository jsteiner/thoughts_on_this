require 'spec_helper'

describe TextSubject do
  it { should have_one(:discussion) }
  it { should accept_nested_attributes_for(:discussion) }
  it { should allow_mass_assignment_of(:content) }
  it { should allow_mass_assignment_of(:language) }

  context 'AVAILABLE_LANGUAGES' do
    it 'is enumerable' do
      TextSubject::AVAILABLE_LANGUAGES.should respond_to(:each)
    end
  end

  it 'includes some likely candidates' do
    %w(Bash Ruby Java).each do |language|
      TextSubject::AVAILABLE_LANGUAGES.should include language
    end
  end
end
