class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :name
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
