require 'rails_helper'

RSpec.describe Profession, type: :model do
  it do
    should define_enum_for(:title).with(["Design", "Engenharia", "Programação", "Psicologia"])
  end
  
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
