class Game
    require_relative "board.rb" 
    require_relative "computerplayer.rb"
    require_relative "humanplayer.rb"
    

    def initialize(x_player, o_player)
        @x_player = x_player
        @x_player.piece = :X
        @o_player = o_player
        @o_player.piece = :O
        @board = Board.new
        @current_player = x_player
    end

    def winner
        return nil unless @board.over?
       
        if board.win?(@x_player.piece)
            @x_player.name
        elsif board.win?(@o_player.piece)
            @o_player.name
        else
            "No one"
        end
    end

    def play
        self.play_move until @board.over?
        @board.display
        puts self.winner + " is victorious!"
    end

    def play_move
        @board.display
        until @board.move(@current_player.get_move, @current_player.piece)
            puts "Please place piece on a valid square"
        end
        change_turn
    end

    def change_turn
        @current_player == @x_player ? @current_player = @o_player : @current_player = @x_player
    end

end

