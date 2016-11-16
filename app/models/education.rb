class Education < ActiveRecord::Base
  belongs_to :user

  enum degree: ["Tecnólogo", "Bacharelado", "Licenciatura", "Especialização", "Mestrado", "Doutorado"]
end
