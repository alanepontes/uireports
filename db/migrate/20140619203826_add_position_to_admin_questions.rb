class AddPositionToAdminQuestions < ActiveRecord::Migration
  def change
    add_column :admin_questions, :position, :integer
  end
end
