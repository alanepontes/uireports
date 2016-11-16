class CreateAdminDevices < ActiveRecord::Migration
  def change
    create_table :admin_devices do |t|
      t.string :name,     :null => false, :default => "" 

      t.timestamps
    end
  end
end
