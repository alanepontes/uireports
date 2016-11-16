class CreateAdminQuestions < ActiveRecord::Migration
  def change
    create_table :admin_questions do |t|
      t.string :name
      t.text :description
      t.integer :heuristic_id

      t.timestamps
    end
  end
end
