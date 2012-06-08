require 'spec_helper'

describe Discussion do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }

  context '#ordered_messages' do
    it 'returns messages in chronological order' do
      discussion = create(:discussion, :image)
      oldest_message = create(:message)
      newest_message = create(:message)
      discussion.messages << oldest_message
      discussion.messages << newest_message
      discussion.ordered_messages.should == [oldest_message, newest_message]
    end
  end
end
