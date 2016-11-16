class ChangeDefaultValue < ActiveRecord::Migration
  def change
  	change_column :users, :age, :integer,     :null => true
  end
end
