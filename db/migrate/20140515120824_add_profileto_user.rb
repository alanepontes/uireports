class AddProfiletoUser < ActiveRecord::Migration
  def change
  	add_column :users, :age, :integer
  	add_column :users, :work, :string,     :null => false, :default => ""
  	add_column :users, :study, :string,     :null => false, :default => ""
  	add_column :users, :country, :text,     :null => false, :default => ""
  	add_column :users, :city, :text,     :null => false, :default => ""
  end
end
