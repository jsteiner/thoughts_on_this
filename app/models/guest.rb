class Guest
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  # TODO: change this to name, once that is implemented in User
  attr_reader :email

  def initialize(email = nil)
    @email = email
  end

  def persisted?
    false
  end
end
