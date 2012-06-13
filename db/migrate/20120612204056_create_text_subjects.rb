class CreateTextSubjects < ActiveRecord::Migration
  def change
    create_table :text_subjects do |t|
      t.string :language
      t.text :content
    end
  end
end
