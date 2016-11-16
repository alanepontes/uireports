require 'rails_helper'

feature 'Check profession select options' do
  scenario 'check if field options combines with defined options in enum title' do
    visit root_path

    click_link "Criar conta"
    
    within("#professions") do
      ["Design", "Engenharia", "Programação", "Psicologia"].each do |option|
        expect(find("option[value=#{option}]").text).to eq(option)
      end
    end
  end
end