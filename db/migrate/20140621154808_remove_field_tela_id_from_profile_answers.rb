class RemoveFieldTelaIdFromProfileAnswers < ActiveRecord::Migration
  def change
    remove_column :profile_answers, :tela_id, :integer
  end
end
