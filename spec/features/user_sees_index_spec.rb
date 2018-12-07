require 'rails_helper'

describe 'user_index' do
  it 'user_sees_astronauts' do
    neil = Astronaut.create(name: "N.A.", age: 55, job: "Commander")
    buzz = Astronaut.create(name: "B.A.", age: 65, job: "Flight")

    visit astronauts_path

    expect(page).to have_content(neil.name)
    expect(page).to have_content(neil.age)
    expect(page).to have_content(neil.job)
    expect(page).to have_content(buzz.name)
    expect(page).to have_content(buzz.age)
    expect(page).to have_content(buzz.job)
  end
end
