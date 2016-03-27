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

    leaderboard = leaderboard.sort { |a,b| b[:score] <=> a[:score] }[0,10]

    leaderboard

  end
end
