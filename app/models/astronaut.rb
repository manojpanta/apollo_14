class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions


  def self.average_age
    average(:age)
  end

  def missions_in_alphabetical_order
    missions.order('title')
  end
end
