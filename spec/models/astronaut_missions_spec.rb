require 'rails_helper'

describe AstronautMission, type: :model do
  it{should belong_to(:astronaut)}
  it{should belong_to(:mission)}
end
