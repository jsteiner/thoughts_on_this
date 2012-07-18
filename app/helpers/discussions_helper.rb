module DiscussionsHelper
  def link_to_raw_subject(subject)
    if subject.class == ImageSubject
      link_to 'Raw', subject.image.url, class: 'raw', target: '_blank'
    else
      nil
    end
  end
end