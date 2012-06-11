require 'spec_helper'

describe Discussion do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }

  context '#generate_unique_url' do
    it 'does not change the url on update' do
      discussion = create(:discussion, :image)
      url = discussion.url
      discussion.name = "New name"
      discussion.save
      discussion.url.should == url
    end
  end

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

  context '#destroy' do
    it "also destroys the discussion's messages" do
      discussion = create(:discussion, :image)
      message = create(:message, discussion: discussion)
      Message.all.should have(1).item
      discussion.destroy
      Message.all.should have(0).items
    end
  end
end
