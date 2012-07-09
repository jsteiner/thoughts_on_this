class Guest
  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end

  def full_name
    if has_full_name?
      "#{@first_name} #{@last_name}"
    else
      nil
    end
  end

  def has_full_name?
    @first_name && @last_name
  end

  def persisted?
    false
  end

  def id
    nil
  end
end
