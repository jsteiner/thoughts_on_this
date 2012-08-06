namespace :image_cleaner do
  desc "remove unclaimed images"
  task :clean => :environment do
    join_query = "LEFT OUTER JOIN discussions
                  ON discussions.subject_id = image_subjects.id
                  AND discussions.subject_type = 'ImageSubject'"
    unclaimed_image_subjects = ImageSubject.joins(join_query).where('image_subjects.created_at < ? AND discussions.subject_id IS NULL', 1.days.ago)
    puts "Deleting #{unclaimed_image_subjects.size} unclaimed images"
    unclaimed_image_subjects.destroy_all
  end
end
