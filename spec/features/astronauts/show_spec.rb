require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit /astronauts" do
    before(:each) do

      @astronaut1 = Astronaut.create(
        name: "Vick Venus",
        age: "30",
        job: "fire guy")

      @astronaut2 = Astronaut.create(
        name: "Marcus Mercury",
        age: "38",
        job: "Gas man")

      @mission1 = Mission.create(
        title: "Mars",
        time_in_space: "61"
      )

      @mission2 = Mission.create(
        title: "Apollo 13",
        time_in_space: "121"
      )

      @astronaut1.missions << [@mission1, @mission2]
      @astronaut2.missions << [@mission2]

    end

    it " I see a list of the astronauts" do
      visit '/astronauts'

      expect(page).to have_content(@astronaut1.name)
      expect(page).to have_content(@astronaut2.name)
    end

    it "I see the average age of the astronauts" do
      visit '/astronauts'

      expect(page).to have_content("Average Age: 34")
    end

    it "I see a list of space missions for each astronaut" do
      visit '/astronauts'

      expect(page).to have_content("Mars", count: 1)
      expect(page).to have_content("Apollo 13", count: 2)
    end

    it "I see total time in space for each astronaut" do
      visit '/astronauts'

        expect(page).to have_content("Total Time in Space: 182 days")
        expect(page).to have_content("Total Time in Space: 121 days")
    end
  end
end
