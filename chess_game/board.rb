require_relative 'piece'
require_relative 'null_piece'
require 'byebug'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8){nil}  }
        self.populate_board
    end


    def [](pos)
        x = pos[0]
        y = pos[1]
        self[x][y]
    end


    def []=(pos, val)
        self[x][y] = val
    end


    def move_piece(start_pos, end_pos)
        raise "Empty position!" if @rows[start_pos].empty?
        raise "This space is already filled!" if !@rows[end_pos].empty?

        if (start_pos[0] > 7 or start_pos[0] < 0) or (end_pos[0] > 7 or end_pos[0] < 0)
            raise "Invalid row!"
        elsif (start_pos[1] > 7 or start_pos[1] < 1) or (end_pos[1] > 7 or end_pos[1] < 0)
            raise "Invalid col!"
        end

        @rows[end_pos] = @rows[start_pos]
        @rows[start_pos] = nil
    end


    def populate_board
        # Populate with NullPiece
        (2..5).each do |row|
            (0..7).each do |col|
                @rows[row,col] = NullPiece.instance
            end
        end

        # Populate with pawns
        (0..7).each do |col|
            @rows[1,col] = Pawn.new(:black, self, [1,col])
            @rows[6,col] = Pawn.new(:white, self, [6,col])
        end

        # Populate with rooks
        @rows[0,0] = Rook.new(:black, self, [0,0])
        @rows[0,7] = Rook.new(:black, self, [0,7])
        @rows[7,0] = Rook.new(:white, self, [7,0])
        @rows[7,7] = Rook.new(:white, self, [7,7])

        # Populate with knights
        @rows[0,1] = Rook.new(:black, self, [0,1])
        @rows[0,6] = Rook.new(:black, self, [0,6])
        @rows[7,1] = Rook.new(:white, self, [7,1])
        @rows[7,6] = Rook.new(:white, self, [7,6])

        # Populate with bishops
        @rows[0,2] = Rook.new(:black, self, [0,2])
        @rows[0,5] = Rook.new(:black, self, [0,5])
        @rows[7,2] = Rook.new(:white, self, [7,2])
        @rows[7,5] = Rook.new(:white, self, [7,5])

        # Populate with queens
        @rows[0,3] = Rook.new(:black, self, [0,3])
        @rows[7,3] = Rook.new(:black, self, [7,3])

        # Populate with kings
        @rows[0,4] = Rook.new(:white, self, [0,4])
        @rows[7,4] = Rook.new(:white, self, [7,4])
    end
end