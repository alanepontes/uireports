class AddProjectIdToProfileAnswers < ActiveRecord::Migration
  def change
    add_column :profile_answers, :project_id, :integer
  end
end
