require 'rails_helper'

describe 'A movie' do

  it 'should be a flop if the total gross is less than $50 million' do
    movie = Movie.new(total_gross: 49999999.99)

    expect(movie.flop?).to be_truthy
  end

  it 'should show the total gross if it is $50 million or more' do
    movie = Movie.new(total_gross: 50000000.00)

    expect(movie.flop?).to be_falsey
  end

  it 'is released when the released on date is in the past' do
    movie = Movie.create(movie_attributes(released_on: 3.months.ago))

    expect(Movie.released).to include(movie)
  end

  it 'is not released when the released on date is in the future' do
    movie = Movie.create(movie_attributes(released_on: 3.months.from_now))

    expect(Movie.released).not_to include(movie)
  end

  it 'returns released movies ordered with the most recently-released movie first' do
    movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
    movie3 = Movie.create(movie_attributes(released_on: 1.months.ago))

    expect(Movie.released).to eq([movie3, movie2, movie1])
  end

end