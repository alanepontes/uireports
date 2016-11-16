class CreateProfileAnswers < ActiveRecord::Migration
  def change
    create_table :profile_answers do |t|
      t.boolean :problem,     :null => false, :default => false
      t.integer :level,     :null => false, :default => 0
      t.text :comment
      t.integer :user_id
      t.integer :question_id
      t.integer :tela_id

      t.timestamps
    end
  end
end
