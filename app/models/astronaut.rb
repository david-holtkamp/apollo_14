class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    Astronaut.average(:age).round
  end

  def mission_count
    missions.pluck(:title).sort
  end

  def hours_in_space
    missions.pluck(:time_in_space).sum
  end
end
