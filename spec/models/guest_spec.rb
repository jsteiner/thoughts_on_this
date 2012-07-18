require "spec_helper"

describe Guest do
  context "#has_name?" do
    it "returns true if the guest has a name" do
      guest = Guest.new("Joe")
      guest.should have_name
    end

    it "returns false if the guest does not have a name" do
      guest = Guest.new(nil)
      guest.should_not have_name
    end
  end

  context "#persisted?" do
    it "always returns false" do
      Guest.new("a").should_not be_persisted
    end
  end

  context "#id" do
    it "always returns nil" do
      Guest.new("a").id.should be_nil
    end
  end
end
