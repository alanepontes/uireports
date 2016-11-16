require 'rails_helper'

RSpec.describe Language, type: :model do
  it do
    should define_enum_for(:name).with(["Inglês", "Espanhol", "Alemão", "Francês", "Italiano", "Japonês"])
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
