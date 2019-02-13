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
end
