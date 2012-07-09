require "spec_helper"

describe Guest do
  context "#has_full_name?" do
    it "returns true if the guest has a name" do
      guest = Guest.new("Joe", "Shmoe")
      guest.should have_full_name
    end

    it "returns false if the guest does not have a full name" do
      guest = Guest.new(nil, "Last name")
      guest.should_not have_full_name
    end
  end

  context "#full_name" do
    it "is the first and last name" do
      Guest.new("Joe", "Smith").full_name.should == "Joe Smith"
    end

    it "returns nil if the user does not have a first and last name" do
      Guest.new(nil, "Smith").full_name.should be_nil
    end
  end

  context "#persisted?" do
    it "always returns false" do
      Guest.new("a", "b").should_not be_persisted
    end
  end

  context "#id" do
    it "always returns nil" do
      Guest.new("a", "b").id.should be_nil
    end
  end
end
