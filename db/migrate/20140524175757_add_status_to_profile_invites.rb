class AddStatusToProfileInvites < ActiveRecord::Migration
  def change
    add_column :profile_invites, :status, :boolean,     :null => false, :default => false
  end
end
