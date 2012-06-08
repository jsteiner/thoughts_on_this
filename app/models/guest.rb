class Guest
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end

  def full_name
    if @first_name && @last_name
      "#{@first_name} #{@last_name}"
    else
      nil
    end
  end

  def persisted?
    false
  end
end
