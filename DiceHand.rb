require_relative 'Die'

class DiceHand
    attr_reader :total, :dice
    def initialize(numDie, sides)
        @dice = []
        (1..numDie).each do |i|
            @dice << Die.new(sides)
        end
        @total = nil
    end

    def roll
        end_turn = false
        roll_total = 0
        @total = 0

        until endTurn == true
            @total += roll_total
            roll_total = 0
            @dice.each do |die|
                die_value = die.roll
                if die_value == 2 || die_value == 5
                    end_turn = true
                end
                roll_total += dieValue
            end
        end
    end
end
