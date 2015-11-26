require 'rails_helper'

RSpec.describe MoviesController do
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
      release_date: "11/19/2015"
    })
  end

  describe 'find movies with same director' do
    it 'should redirect to movies with same directors page5950' do
      expect(:get => "/movies/1/match").to route_to(:controller => "movies", :action => "match", :id => "1")
    end
  end

  describe 'current movie has no director info' do
    it 'should redirect to home page' do
      expect(:get => "/movies/3/match").to route_to(:controller => "movies", :action => "match", :id => "3")
    end
  end
end
