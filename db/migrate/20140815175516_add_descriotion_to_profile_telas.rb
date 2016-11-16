class AddDescriotionToProfileTelas < ActiveRecord::Migration
  def change
    add_column :profile_telas, :description, :string
  end
end
