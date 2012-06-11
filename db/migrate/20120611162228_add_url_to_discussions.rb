class AddUrlToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :url, :string
  end
end
