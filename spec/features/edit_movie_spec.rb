require 'rails_helper'

describe 'Editing a movie' do
  # it "should display a form with the current info" do
  #   movie = Movie.create(movie_attributes(title: "Iron Man"))
  #
  #   visit edit_movie_path(movie)
  #
  #   expect(page).to have_text("Editing Iron Man")
  #
  # end

  it "updates the movie and shows the movie's updated details" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link 'Edit'

    expect(current_path).to eq(edit_movie_path(movie))

    expect(find_field('Title').value).to eq(movie.title)
    expect(find_field('Description').value).to eq(movie.description)
    expect(find_field('Rating').value).to eq(movie.rating)
    expect(find_field('Released on').value.to_date).to eq(movie.released_on.to_date)

    fill_in 'Title', with: 'Updated Movie Title'
    click_button 'Update Movie'
    expect(current_path).to eq(movie_path(movie))
    expect(page).to have_text('Updated Movie Title')
  end

  it "does not update the movie if it's invalid" do
    movie = Movie.create(movie_attributes)

    visit edit_movie_url(movie)

    fill_in 'Title', with: " "

    click_button 'Update Movie'

    expect(page).to have_text('error')
  end

end