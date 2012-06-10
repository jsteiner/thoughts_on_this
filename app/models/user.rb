class User < ActiveRecord::Base
  include Clearance::User
  has_many :discussions, dependent: :destroy
  attr_accessible :first_name, :last_name

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      nil
    end
  end

  def has_name?
    first_name && last_name
  end
end