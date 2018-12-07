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

  it 'user_sees_avg_age' do
    Astronaut.create(name: "N.A.", age: 55, job: "Commander")
    Astronaut.create(name: "B.A.", age: 65, job: "Flight")
    visit astronauts_path

    expect(page).to have_content(Astronaut.average_age)
  end

  it 'user_sees_space_missions_in_alpha_order' do
    m_1 = Mission.create(title: "Apollo 13", time_in_space: 44)
    m_2 = Mission.create(title: "Zebra 13", time_in_space: 410)
    m_3 = Mission.create(title: "Gemini 5", time_in_space: 67)

    visit astronauts_path

    expect(page).to have_content("#{m_1.title} #{m_3.title} #{m_2.title}")
  end
end
