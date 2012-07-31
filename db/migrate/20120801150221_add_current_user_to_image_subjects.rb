class AddCurrentUserToImageSubjects < ActiveRecord::Migration
  def change
    add_column :image_subjects, :user_id, :integer
    add_index :image_subjects, :user_id
  end
end
