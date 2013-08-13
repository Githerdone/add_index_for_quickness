class AddTotalKarmaToUser < ActiveRecord::Migration
  def up
    add_column :users, :total_karma, :integer
    users = execute "SELECT id FROM users";
    users.each do |user|
      user_id = user["id"].to_i
      results = execute("SELECT SUM(value) as total_karma FROM karma_points WHERE user_id=#{user_id}")
      total_karma = results[0]["total_karma"]
      execute("UPDATE users SET total_karma=#{total_karma} WHERE id=#{user_id}")
    end
  end

  def down
    remove_column :users, :total_karma
  end
end
