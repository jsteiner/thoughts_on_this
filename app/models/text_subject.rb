class TextSubject < ActiveRecord::Base
  attr_accessible :content, :language
  has_one :discussion, as: :subject
  accepts_nested_attributes_for :discussion

  def self.available_languages
    %w(Bash C C# C++ CSS Django Erlang
       Go HTML HTTP Haskell JSON Java Javascript
       Markdown Nginx Objective\ C PHP Perl Python
       Ruby SQL Scala)
  end
end
