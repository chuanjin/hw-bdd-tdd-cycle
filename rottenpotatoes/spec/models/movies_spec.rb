require 'rails_helper'

RSpec.describe Movie do
  before :each do
    Movie.create({
      title: "TestMovie1",
      rating: "G",
      description: "Description1",
      release_date: "11/19/2015",
      director: "Director1"
    })
    Movie.create({
      title: "TestMovie2",
      rating: "R",
      description: "Description2",
      release_date: "11/18/2015",
      director: "Director1"
    })
    Movie.create({
      title: "TestMovie3",
      rating: "PG",
      description: "Description3",
      release_date: "11/19/2015",
      director: "Director2"
    })
  end
  
  describe "When searching for Director1" do
    before :each do
      @same_director_movies = Movie.where(director: "Director1")
    end

    it "should find movies by the same director" do
      expect([@same_director_movies.size, @same_director_movies[0].title, @same_director_movies[1].title]).to eq([2, "TestMovie1", "TestMovie2"])
    end
  
    it "should not find movies by different directors" do
      expect(@same_director_movies.where(title: "TestMovie3")[0]).to eq(nil)
    end
  end
end
