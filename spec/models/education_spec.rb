require 'rails_helper'

RSpec.describe Education, type: :model do
  it do
    should define_enum_for(:degree).with(["Tecnólogo", "Bacharelado", "Licenciatura", "Especialização", "Mestrado", "Doutorado"])
  end
  
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
