require 'rails_helper'

RSpec.describe Knowledge, type: :model do
  it do
    should define_enum_for(:title).with(["Práticas de IHC", "Design", "Psicologia Cognitiva", "Programação"])
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
