class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.integer :title
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
