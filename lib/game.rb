require 'forwardable'

class Game

  extend Forwardable

    def_delegator :@player_1, :name, :name1
    def_delegator :@player_2, :name, :name2
    def_delegator :@player_2, :hit_points, :hit_points2

    attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def attack(player)
    player.receive_damage
  end

end