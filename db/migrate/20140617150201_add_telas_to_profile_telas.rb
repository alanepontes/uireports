class AddTelasToProfileTelas < ActiveRecord::Migration
  def self.up
    add_attachment :profile_telas, :tela
  end

  def self.down
    remove_attachment :profile_telas, :tela
  end
end