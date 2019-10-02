class ComputerPlayer

    attr_reader :name
    attr_accessor :piece

    def initialize(name = "Computer")
        @name = name
        @piece 
    end

    def get_move
        puts "I shall move here:"


    end

    def minimax(board, player)
        current_piece = player.piece

        if board.over? 
            if board.draw?
                return 0
            elsif board.win?(current_piece)
                return 1
            else
                return -1
            end
        end

        valid_moves = board.valid_moves
        
        

    end



end