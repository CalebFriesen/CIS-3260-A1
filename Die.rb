class Die
    attr_reader :value
    def initialize(sides)
        @sides = sides
        @value = nil
    end

    def roll
        @value = rand(1..@sides)
    end
end