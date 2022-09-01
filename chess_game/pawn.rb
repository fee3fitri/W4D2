require_relative 'piece'

class Pawn < Piece
include Stepable

    def moves
        unchecked_moves = []
        valid_moves = []

        valid_moves_black = [[1,0], [1,-1], [1,1]]
        valid_moves_white = [[-1,0], [-1,1], [-1,-1]]

        if at_start_row? and color == :black
            unchecked_moves = valid_moves_black
            unchecked_moves << [2,0]
        elsif at_start_row? and color == :white
            unchecked_moves = valid_moves_white
            unchecked_moves << [-2,0]
        elsif !at_start_row? and color == :black
            unchecked_moves = valid_moves_black
        elsif !at_start_row? and color == :white
            unchecked_moves = valid_moves_white
        end

        valid_moves << checking_available_pos(unchecked_moves)
        valid_moves
    end

    def at_start_row?
        (color == :black and pos[0] == 1) or (color == :white and pos[0] == 6)
    end
end