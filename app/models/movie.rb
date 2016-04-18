class Movie < ActiveRecord::Base

  def flop?
    total_gross.blank? || total_gross < 50000000.00
  end

  def self.released
    now = Time.new
    Movie.where('released_on < ?', now).order('released_on desc')
  end

end
