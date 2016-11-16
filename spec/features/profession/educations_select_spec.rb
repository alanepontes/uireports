require 'rails_helper'

feature 'Check education select options' do
  scenario 'check if field options combines with defined options in enum degree' do
    visit root_path

    click_link "Criar conta"
    
    within("#educations") do
      ["Tecnólogo", "Bacharelado", "Licenciatura", "Especialização", "Mestrado", "Doutorado"].each do |option|
        expect(find("option[value=#{option}]").text).to eq(option)
      end
    end
  end
end