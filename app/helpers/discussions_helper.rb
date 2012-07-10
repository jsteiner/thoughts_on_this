module DiscussionsHelper
  def truncate_title(title)
    truncate(title, length: 70, omission: '...')
  end
end