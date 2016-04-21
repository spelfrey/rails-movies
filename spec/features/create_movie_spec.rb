require 'rails_helper'

describe 'Creating a new movie' do

  it 'should display an empty form' do
    movie = Movie.new

    visit new_movie_path

    expect(page).to have_text('Add New Movie')
    expect(find_field('Title').value).to eq(movie.title)
  end

  it "saves the movie and shows the new movie's details" do
    visit movies_url

    click_link 'Add New Movie'

    expect(current_path).to eq(new_movie_path)

    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "Superheroes saving the world from villains"
    # fill_in "Rating", with: "PG-13"
    select 'PG-13', :from => 'movie_rating'
    fill_in "Total gross", with: "75000000"
    fill_in "Cast", with: "The award-winning cast"
    fill_in "Director", with: "The ever-creative director"
    fill_in "Duration", with: "123 min"
    fill_in "Image file name", with: "movie.png"
    # select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"

    # If you're taking advantage of the HTML 5 date field in Chrome,
    # you'll need to use 'fill_in' rather than 'select'
    fill_in "Released on", with: (Time.now - 1).to_s

    click_button 'Create Movie'

    expect(current_path).to eq(movie_path(Movie.last))

    expect(page).to have_text('New Movie Title')
  end

end