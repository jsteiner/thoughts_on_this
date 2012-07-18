module DiscussionsHelper
  def raw_subject_url(discussion)
    case discussion.subject_type
      when "ImageSubject"
        discussion.subject.image
      when "TextSubject"
        discussion.subject.content
    end
  end
end