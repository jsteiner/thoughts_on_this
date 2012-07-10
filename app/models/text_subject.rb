class TextSubject < ActiveRecord::Base
  attr_accessible :content, :language
  has_one :discussion, as: :subject
  accepts_nested_attributes_for :discussion

  AVAILABLE_LANGUAGES = %w(Bash C C# C++ CSS Django Erlang
       Go HTML HTTP Haskell JSON Java Javascript
       Markdown Nginx) + ['Objective C'] +
       %w(PHP Perl) + ['Plain Text'] + %w(Python Ruby SQL Scala)
end
