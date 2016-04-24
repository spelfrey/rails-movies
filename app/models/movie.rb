class Movie < ActiveRecord::Base

  validates :title, :released_on, :duration, presence: true

  validates :description, length: { minimum: 25 }

  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  validates :image_file_name, allow_blank: true, format: {
      with:    /\w+\.(gif|jpg|png)\z/i,
      message: 'must reference a GIF, JPG, or PNG image'
  }

  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: RATINGS

  has_many :reviews, dependent: :destroy

  def flop?
    total_gross.blank? || total_gross < 50000000.00
  end

  def self.released
    now = Time.new
    Movie.where('released_on < ?', now).order('released_on desc')
  end

  def average_stars
    reviews.average(:stars)
  end

  def has_stars?
    average_stars.nil?
  end

end
