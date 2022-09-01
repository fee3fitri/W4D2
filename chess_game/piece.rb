# require_relative 'board'

class Piece
attr_reader :color, :board, :pos

    def initialize(symbol, board, pos)
        @color = symbol
        @board = board
        @pos = pos
    end

    def moves
        valid_pos = []
        valid_pos
    end

    def empty?
        return false
    end
end