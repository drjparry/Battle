require 'forwardable'

class Game

  attr_reader :current, :opponent

  extend Forwardable

    def_delegator :@player_1, :name, :name1
    def_delegator :@player_2, :name, :name2
    def_delegator :@player_2, :hit_points, :hit_points2
    def_delegator :@player_1, :hit_points, :hit_points1

    attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current  = player_1
    @opponent = player_2
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turns
    self.current.name == self.player_1.name ? (self.current = player_2) : (self.current = player_1)
    self.opponent.name == self.player_2.name ? (self.opponent = player_1) : (self.opponent = player_2)
  end

  private

  attr_writer :current, :opponent

end