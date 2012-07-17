class AddUserNumberOffsetColumnToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :user_number_offset, :integer, null: false, default: 0
  end
end
