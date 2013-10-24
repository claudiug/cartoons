class Statistic

  def total_songs
    Song.count
  end

  def total_characters
    Character.count
  end

  def total_quotes
    Quote.count
  end

  def total_episodes
    Episode.count
  end

  def total_cartoons
    Cartoon.count
  end

end