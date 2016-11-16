class CreateProfileEvaluations < ActiveRecord::Migration
  def change
    create_table :profile_evaluations do |t|
      t.integer :user_id
      t.integer :project_id
    end
  end
end
