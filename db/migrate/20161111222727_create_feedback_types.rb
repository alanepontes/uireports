class CreateFeedbackTypes < ActiveRecord::Migration
  def change
    create_table :feedback_types do |t|
      t.string :info, null: false
      t.timestamps null: false
      t.integer :position
    end
  end
end
