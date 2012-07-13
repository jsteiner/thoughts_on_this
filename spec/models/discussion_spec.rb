require 'spec_helper'

describe Discussion do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }

  context '#generate_unique_url' do
    it 'does not change the url on update' do
      discussion = create(:discussion, :text)
      url = discussion.url
      discussion.name = "New name"
      discussion.save
      discussion.url.should == url
    end
  end

  context '#ordered_messages' do
    it 'returns messages in chronological order' do
      discussion = create(:discussion, :text)
      oldest_message = create(:message)
      newest_message = create(:message)
      discussion.messages << oldest_message
      discussion.messages << newest_message
      discussion.ordered_messages.should == [oldest_message, newest_message]
    end
  end

  context '#user_names' do
    it 'returns a unique array of user_names in the correct order' do
      discussion = create(:discussion, :text)
      first_message = create(:message, user_name: 'Peter Parker', discussion: discussion)
      second_message = create(:message, user_name: 'Bruce Banner', discussion: discussion)
      third_message = create(:message, user_name: 'Scott Summers', discussion: discussion)
      duplicate_user_message = create(:message, user_name: 'Bruce Banner', discussion: discussion)
      discussion.user_names.should == ['Peter Parker', 'Bruce Banner', 'Scott Summers']
    end
  end

  context '#user_number' do
    it 'returns the index of the user name' do
      discussion = create(:discussion, :text)
      discussion.stubs(:user_names).returns(['Peter Parker', 'Bruce Banner', 'Scott Summers'])
      discussion.user_number('Bruce Banner').should == 1
    end
  end

  context '#destroy' do
    it "also destroys the discussion's messages" do
      discussion = create(:discussion, :text)
      message = create(:message, discussion: discussion)
      Message.all.should have(1).item
      discussion.destroy
      Message.all.should have(0).items
    end
  end
end
