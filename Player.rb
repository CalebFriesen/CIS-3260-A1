require_relative 'DiceHand'

class Player
    attr_reader :name, :score, :dice_count, :eliminated

    def initialize(name, dice_count, sides)
        @name = name
        @dice_hand = DiceHand.new(dice_count, sides)
        @score = 0
        @dice_count = dice_count
        @eliminated = false
    end

    def take_turn
        turn_over = false

        until turn_over
            roll = @dice_hand.roll
            roll_value = 0
            removed_dice = @dice_hand.remove_dice
            if removed_dice > 0
                turn_over = true
                @dice_count -= removed_dice
            else
                roll_value = @dice_hand.total
                @score += roll_value
            end
            puts "Rolled: #{roll} | Roll value: #{roll_value} | Total score: #{@score}"
        end
        if @dice_count != 1
            puts "End of turn, #{@name} has #{@dice_count} dice remaining\n\n"
        else
            puts "End of turn, #{@name} has 1 die remaining\n\n"
        end
    end

    def elimination_check
        if @dice_count == 0
            @eliminated = true
            puts "#{name} has run out of dice and finishes with a score of #{@score}\n\n"
        end
        @eliminated
    end
end