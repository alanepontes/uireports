class CreateProfileProjects < ActiveRecord::Migration
  def change
    create_table :profile_projects do |t|
      t.string :name,     :null => false, :default => "" 
      t.text :description
      t.integer :status,     :null => false, :default => 1
      t.integer :heuristic_id

      t.timestamps
    end
  end
end
