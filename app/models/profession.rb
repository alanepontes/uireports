class Profession < ActiveRecord::Base
  belongs_to :user

  enum title: ["Design", "Engenharia", "Programação", "Psicologia"]
end
