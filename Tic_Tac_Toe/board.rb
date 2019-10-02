class Board 

    attr_reader :board

    def initialize(board = nil)
        @board = board || Array.new(3) { [nil, nil, nil] }
    end

    def valid_move?(pos)
        row, col = pos
        return false if row > 2 || row < 0 || col > 2 || col < 0
        @board[row][col].nil?
    end

    def valid_moves
        moves = []
        (0..2).each do |row|
            (0..2).each do |col|
                moves << [row, col] if self.board[row][col].nil?
            end
        end
        moves
    end

    def move(position, piece)
        row, col = position
        if valid_move?(position) 
            @board[row][col] = piece 
            true
        else
            false
        end
    end

    def over?
        self.draw? || self.win?(:X) || self.win?(:O)
    end

    def draw?
        full = (0..2).all? do |row|
            (0..2).none? { |col| @board[row][col].nil? }
        end
    end

    def win?(piece)
        winning_diagonal?(piece) || winning_col?(piece) || winning_row?(piece)  
    end

    def display
        puts "\n|~~~~~~~~~~~|\n" 
        @board.each do |row|
            disp = "|   "
            row.each do |ele| 
                ele.nil? ? disp += "_ " : disp += ele.to_s + " "
            end
            puts disp + "  |"
        end
        puts "|~~~~~~~~~~~|\n\n" 
    end    

    private

    def winning_row?(piece)
        (0..2).each do |row|
            return true if @board[row].all? { |el| el == piece }
        end
        false
    end

    def winning_col?(piece)
        (0..2).each do |col|
            return true if (0..2).all? do |row|
                @board[row][col] == piece
            end
        end
        false
    end

    def winning_diagonal?(piece)
        (0..2).all? { |i| @board[i][i] == piece } || (0..2).all? { |i| @board[i][2-i] == piece }
    end
end

# board = [
#     [:X, :X, :O],
#     [:X, :X, :O],
#     [:X, :O, :X]
# ]
