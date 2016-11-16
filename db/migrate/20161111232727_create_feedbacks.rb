class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :rate, null: false

      t.belongs_to :evaluation, index: true
      t.belongs_to :feedback_type, index: true
      t.timestamps null: false
    end

    add_foreign_key :feedbacks, :profile_evaluations, column: :evaluation_id
  end
end
