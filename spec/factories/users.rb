password = "53cr3tp455w0rd"

FactoryGirl.define do
  factory :user, class: 'User' do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
    admin                 { false }
  end
end