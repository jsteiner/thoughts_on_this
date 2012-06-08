class Guest
  def initialize(first_name = nil, last_name = nil)
    @first_name, @last_name = first_name, last_name
  end

  def full_name
    if @first_name && @last_name
      "#{@first_name} #{@last_name}"
    else
      nil
    end
  end

  def has_name?
    @first_name && @last_name
  end

  def persisted?
    false
  end
end
