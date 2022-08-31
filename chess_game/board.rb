require_relative 'piece'

class Board
    def initialize
        # @null_piece = NullPiece.new()
        filled_row = [0, 1, 6, 7]
        @rows = Array.new(8) { Array.new(8){nil}  }

        filled_row.each do |i|
            (0...@rows.length).each do |j|
                @rows[i][j] = Piece.new
            end
        end

        # @rows.each_with_index do |row, i|
        #     if filled_row.include?(i) 
        #         row.each do |square|
        #             square = Piece.new()
        #         end
        #     end
        # end
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
end