require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "#leaderboard" do

    player_1 = Player.create(name: "Peach")
    player_2 = Player.create(name: "Mario")
    player_3 = Player.create(name: "Luigi")
    player_4 = Player.create(name: "Yoshi")
    player_5 = Player.create(name: "Koopa")

    Game.create(winner_id: player_1.id)
    Game.create(winner_id: player_1.id)
    Game.create(winner_id: player_2.id)
    Game.create(winner_id: player_4.id)
    Game.create(winner_id: player_4.id)
    Game.create(winner_id: player_4.id)

    leaderboard = Game.leaderboard

    assert_equal(leaderboard.max {|a,b| a[:score] <=> b[:score] }, leaderboard[0])
    assert_equal(Player.all.count, leaderboard.length)

  end

end
