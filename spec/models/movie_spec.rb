require 'rails_helper'

describe 'A movie' do

  it "should be a flop if the total gross is less than $50 million" do
    movie = Movie.new(total_gross: 49999999.99)

    expect(movie.flop?).to be_truthy
  end

  it "should show the total gross if it is $50 million or more" do
    movie = Movie.new(total_gross: 50000000.00)

    expect(movie.flop?).to be_falsey
  end

end