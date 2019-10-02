class HumanPlayer

    attr_reader :name
    attr_accessor :piece

    def initialize(name = "Human")
        @name = name
        @piece 
    end

    def get_move
        puts self.name + ", please make a move. e.g.: 0, 0"
        input = gets.chomp
        input.split(", ").map(&:to_i)
    end





end