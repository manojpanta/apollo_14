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

  describe 'class methods' do
    it 'average age ' do

      astronaut1 = Astronaut.create(name: 'astronaut1', age: 30, job: 'commandar')
      astronaut2 = Astronaut.create(name: 'astronaut2', age: 25, job: 'leader')
      astronaut3 = Astronaut.create(name: 'astronaut2', age: 35, job: 'leader')

      average_age = Astronaut.average_age

      expect(average_age).to eq((astronaut1.age + astronaut2.age + astronaut3.age)/3)
    end
  end

end
