require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    it 'averages_age' do
    Astronaut.create(name: "N.A.", age: 55, job: "Commander")
    Astronaut.create(name: "B.A.", age: 65, job: "Flight")


    expect(Astronaut.average_age).to eq(60)
  end
  end
end
