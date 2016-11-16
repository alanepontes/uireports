class Changeaboutforuser < ActiveRecord::Migration
  def change
  	change_column :users, :about, :text,     :null => false, :default => ""
  end
end
