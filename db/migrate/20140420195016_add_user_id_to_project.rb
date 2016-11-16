class AddUserIdToProject < ActiveRecord::Migration
  def change
    add_column :profile_projects, :user_id, :integer
  end
end
