require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece

    include Slideable

    def valid_moves
        self.diagonal_moves
    end
end