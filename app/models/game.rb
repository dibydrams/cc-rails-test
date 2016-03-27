class Game < ActiveRecord::Base
  def self.leaderboard
    [
      {:player => "Peach", :score => 2},
      {:player => "Mario"},
      {:player => "Luigi"}
    ]
  end
end
