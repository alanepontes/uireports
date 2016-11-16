class AddEvaluatorIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :evaluator_id, :integer
  end
end
