require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'Class Methods' do
    it 'sort_by_alpha' do
      m_1 = Mission.create(title: "Apollo 13", time_in_space: 44)
      m_2 = Mission.create(title: "Zebra 13", time_in_space: 410)
      m_3 = Mission.create(title: "Gemini 5", time_in_space: 67)

      expect(Mission.sorted_by_alpha).to eq([m_1, m_3, m_2])
    end
  end
end
