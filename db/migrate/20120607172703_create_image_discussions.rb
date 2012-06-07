class CreateImageDiscussions < ActiveRecord::Migration
  def change
    create_table :image_subjects do |t|
      t.has_attached_file :image
    end
  end
end
