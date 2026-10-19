require_relative 'Die'

class DiceHand
    attr_reader :total, :dice
    def initialize(numDie, sides)
        @dice = []
        (1..numDie).each do |i|
            @dice << Die.new(sides)
        end
    end

    def roll
        dice_values = []
        @dice.each do |die|
            dice_values << die.roll
        end
        dice_values
    end

    def total
        total = 0
        @dice.each do |die|
            total += die.value
        end
        total
    end

    def remove_dice
        dead_dice = []
        num_removed = 0
        @dice.each do |die|
            if die.value == 2 || die.value == 5
                dead_dice << die
                num_removed += 1
            end
        end
        @dice -= dead_dice
        num_removed
    end
end
