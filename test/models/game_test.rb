require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "#leaderboard" do

    player_1 = Player.create(name: "Peach")
    player_2 = Player.create(name: "Mario")
    player_3 = Player.create(name: "Luigi")

    Game.create(winner_id: player_1.id)
    Game.create(winner_id: player_1.id)
    Game.create(winner_id: player_2.id)

    leaderboard = Game.leaderboard

    assert_equal(player_1.name, leaderboard[0][:player])
    assert_equal(player_2.name, leaderboard[1][:player])
    assert_equal(player_3.name, leaderboard[2][:player])
    assert_equal(2, leaderboard[0][:score])
    assert_equal(3, leaderboard.length)

  end

end
