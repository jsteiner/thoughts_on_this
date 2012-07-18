class Guest
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def has_name?
    @name.present?
  end

  def persisted?
    false
  end

  def id
    nil
  end
end
