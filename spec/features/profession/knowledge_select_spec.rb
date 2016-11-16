require 'rails_helper'

feature 'Check knowledge select options' do
  scenario 'check if field options combines with defined options in enum title' do
    visit root_path

    click_link "Criar conta"
    
    page.has_select?('knowledge', :options => ["Práticas de IHC", "Design", "Psicologia Cognitiva", "Programação"])
  end
end