require_relative 'piece'
require_relative 'bishop'
require_relative 'rook'

class Queen < Piece
    def valid_moves
        possible_moves = []

        possible_moves << self.vertical_moves
        possible_moves << self.horizontal_moves
        possible_moves << self.diagonal_moves

        possible_moves
    end
end