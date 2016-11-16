class AddPositionToProfileTelas < ActiveRecord::Migration
  def change
    add_column :profile_telas, :position, :integer
  end
end
