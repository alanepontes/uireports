class AddTelaIdToProfileAnswers < ActiveRecord::Migration
  def change
    add_column :profile_answers, :tela_id, :integer
  end
end
