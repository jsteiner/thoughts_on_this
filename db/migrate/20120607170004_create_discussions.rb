class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :name, null:false
      t.integer :subject_id, null:false
      t.string :subject_type, null:false
      t.integer :user_id, null:false
      t.timestamps
    end
    add_index :discussions, :subject_id
    add_index :discussions, :user_id
  end
end
