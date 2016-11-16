class CreateAdminHeuristics < ActiveRecord::Migration
  def change
    create_table :admin_heuristics do |t|
      t.string :name,     :null => false, :default => "" 
      t.text :description
      t.integer :device_id

      t.timestamps
    end
  end
end
