class Game < ActiveRecord::Base
  def self.leaderboard
    leaderboard = []
    Player.all.each do |player|
      leaderboard <<
      {
        :player => player.name,
        :score => Game.where(winner_id: player.id).count
      }
    end

    leaderboard
  end
end
