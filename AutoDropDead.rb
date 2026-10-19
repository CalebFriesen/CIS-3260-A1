require_relative 'Player'


class AutoDropDead
    def play_game(sides, dice_count, player_count)
        players = []
        winners = []
        high_score = 0

        (1..player_count).each do |i|
            players << Player.new("Player #{i}", dice_count, sides)
        end

        until players.all?(&:eliminated)
            players.each do |player|
                if !player.eliminated
                    player.take_turn
                    player.elimination_check
                end
            end
        end

        puts "Final scores"
        
        players.each do |player|
            
            puts "#{player.name}: #{player.score}"
            if player.score > high_score
                high_score = player.score
            end
        end

        players.each do |player|
            if player.score == high_score
                winners << player.name
            end
        end

        if winners.length == 1
            if high_score == 1
                puts "\n#{winners[0]} wins with 1 point!"
            else
                puts "\n#{winners[0]} wins with #{high_score} points!"
            end
        else
            if high_score == 1
                puts "\n#{winners.join(', ')} win with 1 point!"
            else
                puts "\n#{winners.join(', ')} win with #{high_score} points!"
            end
        end
    end
end