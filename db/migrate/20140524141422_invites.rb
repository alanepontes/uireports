class Invites < ActiveRecord::Migration
  def change
   create_table :profile_invites do |t|
     t.string :email 
     t.integer :project_id
     t.integer :user_id
     t.string :token
     
     t.timestamps
    end
   end 
 end