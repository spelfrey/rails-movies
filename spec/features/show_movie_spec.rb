require 'rails_helper'

describe 'Viewing an individual movie' do

  it "shows the movie's details" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
  end

  it 'should show the total gross if it is not less than $50,000,000' do
    movie = Movie.create(movie_attributes(total_gross: 50000000.00))

    visit movie_url(movie)

    expect(page).to have_text('$50,000,000.00')

  end

  it 'should show Flop! if total gross is less than $50,000,000' do
    movie = Movie.create(movie_attributes(total_gross: 49999999.99))

    visit movie_url(movie)

    expect(page).to have_text('Flop!')

  end
end