class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :discussion
      t.text :content
      t.string :user_name
      t.timestamps
    end
    add_index :messages, :discussion_id
  end
end
