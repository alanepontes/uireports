require 'rails_helper'

RSpec.describe User, type: :model do
  context 'nested attributes' do
    it { should accept_nested_attributes_for(:educations) }
    it { should accept_nested_attributes_for(:professions) }
    it { should accept_nested_attributes_for(:knowledges) }
    it { should accept_nested_attributes_for(:experiences) }
    it { should accept_nested_attributes_for(:languages) }
  end

  context 'relations' do
    it { is_expected.to have_many(:educations) }        
    it { is_expected.to have_many(:professions) }
    it { is_expected.to have_many(:knowledges) }
    it { is_expected.to have_many(:experiences) }
    it { is_expected.to have_many(:languages) }
  end
end