class Language < ActiveRecord::Base
  belongs_to :user

  enum name: ["Inglês", "Espanhol", "Alemão", "Francês", "Italiano", "Japonês"]
end
