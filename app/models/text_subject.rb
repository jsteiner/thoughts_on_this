class TextSubject < ActiveRecord::Base
  attr_accessible :content, :language
  has_one :discussion, as: :subject
  accepts_nested_attributes_for :discussion

  def self.available_languages
    %w(Javascript HTML CSS PHP Python Ruby C Shell Scheme Lua C#)
  end
end
