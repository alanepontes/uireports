require 'rails_helper'

RSpec.describe Experience, type: :model do
  it do
    should define_enum_for(:title).with(["Engenharia de software", "Design", "Psicologia", "Programação"])
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
