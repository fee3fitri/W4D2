module Slideable
    def diagonal_moves
        upleft = []
        upright = []
        downright = []
        downleft = []
        valid_moves = []

        (-7..7).each do [i]
            (-7..7).each do [j]
                upleft << [i,j] if j == i * (-1) and i < 0 and j > 0
                upright << [i,j] if i == j and i < 0 and j < 0
                downright << [i,j] if j == i * (-1) and i > 0 and j < 0
                downleft << [i,j] if i == j and i > 0 and j > 0
            end
        end

        valid_moves << checking_available_pos(upleft)
        valid_moves << checking_available_pos(upright)
        valid_moves << checking_available_pos(downright)
        valid_moves << checking_available_pos(downleft)

        valid_moves
    end

    def vertical_moves
        up = []
        down = []
        valid_moves = []
    
        (-7..7).each do [i]
            up << [0,i] if i > 0
            down << [0,i] if i < 0
        end

        valid_moves << checking_available_pos(up)
        valid_moves << checking_available_pos(down)

        valid_moves
    end
    
    def horizontal_moves
        left = []
        right = []
        valid_moves = []
    
        (-7..7).each do [i]
            right << [i,0] if i > 0
            left << [i,0] if i < 0
        end

        valid_moves << checking_available_pos(left)
        valid_moves << checking_available_pos(right)

        valid_moves
    end

    def checking_available_pos(array)
        possible_pos = []
        
        array.each do |ele|
            end_pos_first = pos[0] + ele[0]
            end_pos_last = pos[1] + ele[1]
            piece_pos = board.rows[end_pos_first][end_pos_last]
            on_the_board = (end_pos_first < 7 && end_pos_first >= 0) and (end_pos_last < 7 && end_pos_last >= 0)

            if on_the_board
                if piece_pos.empty?
                    possible_pos << ele
                else
                    if piece_pos.color != color
                        possible_pos << ele
                        return
                    end
                end
            end
        end

        possible_pos
    end
end