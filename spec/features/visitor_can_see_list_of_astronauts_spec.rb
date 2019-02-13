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
end
