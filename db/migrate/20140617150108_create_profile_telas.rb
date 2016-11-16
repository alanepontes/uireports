class CreateProfileTelas < ActiveRecord::Migration
  def change
    create_table :profile_telas do |t|
      t.string :tela
      t.integer :project_id

      t.timestamps
    end
  end
end
