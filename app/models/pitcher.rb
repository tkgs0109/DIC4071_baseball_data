class Pitcher < ApplicationRecord
  def self.get_max_win_pitchers_id(pitchers)
    max_win = pitchers.maximum(:wins)
    best_pitchers = pitchers.where(wins: max_win)
    best_pitchers.pluck(:player_id)
  end
  
  def self.most_winners(year)
    pitchers = Pitcher.where(year_id: year)
    get_max_win_pitchers_id(pitchers)
  end
  
  def self.top_ten(year)
    pitchers = Pitcher.where(year_id: year).order(wins: :desc)
    if pitchers.count < 10
      best_pitchers = pitchers
    else
      tenth_win = pitchers.limit(10)[9].wins
      best_pitchers = pitchers.where("wins >= ?", tenth_win)
    end
    best_pitchers.pluck(:player_id)
  end
  
  def self.most_winners_in_team(year, team)
    pitchers = Pitcher.where(year_id: year, team_id: team)
    get_max_win_pitchers_id(pitchers)
  end
  
  def self.most_winners_in_term(start_year, end_year)
    pitchers = Pitcher.where(year_id: start_year..end_year)
    get_max_win_pitchers_id(pitchers)
  end
end