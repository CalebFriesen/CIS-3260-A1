require_relative 'Die'

class DiceHand
    attr_reader :total
    def initialize(numDie, sides)
        @numDie = numDie
        @die = Die.new(sides)
        @total = nil
    end

    def roll
        @total = 0
        for i in 0..(@numDie-1)
            @total = total + @die.roll
        end
    end
end
