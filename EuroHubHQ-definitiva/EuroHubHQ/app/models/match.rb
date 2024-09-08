class Match < ApplicationRecord
  validate :home_and_away_teams_must_be_different

  private

  def home_and_away_teams_must_be_different
    if team1 == team2
      errors.add(:team1, "Away team and Home team must be different.")
    end
  end
end
