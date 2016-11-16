# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create :name => "Admin", :email => "admin@uireport.com", :password => "12345678", :admin => true

Admin::Device.create [
  { name: "mobile"},
  { name: "web"},
  { name: "desktop"},
  { name: "tv digital"}
]

FeedbackType.create [
  { info: "Comprometimento com o acompanhamento do trabalho", position: 1},
  { info: "Consensus sobre os problemas encontrados", position: 2 },
  { info: "Cobertura da avaliação", position: 3 },
  { info: "Consensus sobre as notas", position: 4 }
]
