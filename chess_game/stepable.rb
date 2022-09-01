module Stepable
    def king_moves
        possible_pos = []

        (-1..1).each do |i|
            (-1..1).each do |j|
                valid_moves << [i,j]
            end
        end

        possible_pos
    end

    def knight_moves
        possible_pos = [[2,1], [-2,-1], [-1,-2], [1,2], [1,-2], [2,-1], [-1,2], [-2,1]]
    end

    def checking_available_pos(array)
        possible_pos = []

        array.each do |ele|
            end_pos_first = pos[0] + ele[0]
            end_pos_last = pos[1] + ele[1]
            piece_pos = board.rows[end_pos_first][end_pos_last]
            on_the_board = (end_pos_first < 7 && end_pos_first >= 0) and (end_pos_last < 7 && end_pos_last >= 0)
            
            if (piece_pos.empty?  or piece_pos.color != color) and on_the_board
                possible_pos << ele
            end
        end

        possible_pos
    end
end