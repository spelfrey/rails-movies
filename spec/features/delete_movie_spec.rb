require 'rails_helper'

describe 'Deleting a movie' do

  it 'removes the movie from the database' do
    movie = Movie.create!(movie_attributes)

    visit movie_path(movie)

    expect(page).to have_text('Delete')

    click_link 'Delete'

    expect(current_path).to eq(movies_path)
    expect(page).not_to have_text(movie.title)
    expect(page).to have_text('Movie successfully deleted!')
  end

end