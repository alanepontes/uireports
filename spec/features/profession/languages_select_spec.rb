require 'rails_helper'

feature 'Check language select options' do
  scenario 'check if field options combines with defined options in enum name' do
    visit root_path

    click_link "Criar conta"
    
    within("#languages") do
      ["Inglês", "Espanhol", "Alemão", "Francês", "Italiano", "Japonês"].each do |option|
        expect(find("option[value=#{option}]").text).to eq(option)
      end
    end
  end
end