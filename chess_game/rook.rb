require_relative 'piece'

class Rook < Piece
    def valid_moves
        possible_moves = []

        possible_moves << self.vertical_moves
        possible_moves << self.horizontal_moves

        possible_moves
    end

end