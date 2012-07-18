class ChangeToSingleNameColumnOnUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string

    select_all('SELECT id, first_name FROM users').each do |row|
      update "UPDATE users SET name = '#{row['first_name']}' WHERE id = #{row['id']}"
    end

    remove_column :users, :first_name
    remove_column :users, :last_name
  end

  def down
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    select_all('SELECT id, name FROM users').each do |row|
      update "UPDATE users SET first_name = '#{row['name']}' WHERE id = #{row['id']}"
    end

    remove_column :users, :name
  end
end
