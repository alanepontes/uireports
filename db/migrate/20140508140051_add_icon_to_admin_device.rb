class AddIconToAdminDevice < ActiveRecord::Migration
  def self.up
    add_attachment :admin_devices, :icon
  end

  def self.down
    remove_attachment :admin_devices, :icon
  end
end