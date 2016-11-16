require 'rails_helper'

feature 'Check experience select options' do
  scenario 'check if field options combines with defined options in enum title' do
    visit root_path

    click_link "Criar conta"
    
    page.has_select?('experience', :options => ["Engenharia de software", "Design", "Psicologia", "Programação"])
  end
end