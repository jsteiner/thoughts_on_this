class AddTimestampsToImageSubjects < ActiveRecord::Migration
  def up
    add_column :image_subjects, :created_at, :datetime
    add_column :image_subjects, :updated_at, :datetime

    ImageSubject.find_each do |image_subject|
      image_subject.touch(:created_at)
    end
  end

  def down
    remove_column :image_subjects, :created_at
    remove_column :image_subjects, :updated_at
  end
end
