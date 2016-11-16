class Knowledge < ActiveRecord::Base
  belongs_to :user

  enum title: ["Práticas de IHC", "Design", "Psicologia Cognitiva", "Programação"]
end
