require 'rails_helper'

describe 'visitor visiting astronauts index page' do
  it ' can show list of astronauts with name age and job' do
    astronaut1 = Astronaut.create(name: 'astronaut1', age: 30, job: 'commandar')
    astronaut2 = Astronaut.create(name: 'astronaut2', age: 40, job: 'leader')


    visit '/astronauts'

    expect(page).to have_content(astronaut1.name)
    expect(page).to have_content(astronaut1.age)
    expect(page).to have_content(astronaut1.job)

    expect(page).to have_content(astronaut2.name)
    expect(page).to have_content(astronaut2.age)
    expect(page).to have_content(astronaut2.job)
  end

  it 'can show average age of all the astronauts' do
    astronaut1 = Astronaut.create(name: 'astronaut1', age: 30, job: 'commandar')
    astronaut2 = Astronaut.create(name: 'astronaut2', age: 25, job: 'leader')
    astronaut3 = Astronaut.create(name: 'astronaut2', age: 35, job: 'leader')


    visit '/astronauts'

    expect(page).to have_content("Average Age: #{(astronaut1.age + astronaut2.age + astronaut3.age)/3}")
  end

  it 'can show average age of all the astronauts' do
    astronaut1 = Astronaut.create(name: 'astronaut1', age: 30, job: 'commandar')
    mission1 = astronaut1.missions.create(title: 'apollo1 3', time_in_space: 3)
    mission2 = astronaut1.missions.create(title: 'capricorn 4', time_in_space: 3)
    mission3 = astronaut1.missions.create(title: 'gemini 7', time_in_space: 3)

    astronaut2 = Astronaut.create(name: 'astronaut1', age: 30, job: 'commandar')
    mission4 = astronaut2.missions.create(title: 'apollo1 4', time_in_space: 3)
    mission5 = astronaut2.missions.create(title: 'capricorn 5', time_in_space: 3)
    mission6 = astronaut2.missions.create(title: 'gemini 8', time_in_space: 3)

    visit '/astronauts'

    expect(page).to have_content(mission1.title)
    expect(page).to have_content(mission2.title)
    expect(page).to have_content(mission3.title)
    expect(page).to have_content(mission4.title)
    expect(page).to have_content(mission5.title)
    expect(page).to have_content(mission6.title)
    
  end

# As a visitor,
# When I visit '/astronauts'
# I see a list of the space missions' in alphabetical order for each astronaut.
#
# (e.g "Apollo 13"
#      "Capricorn 4"
#      "Gemini 7")
end
