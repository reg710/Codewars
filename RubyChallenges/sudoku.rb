# https://www.codewars.com/kata/53db96041f1a7d32dc0004d2/train/ruby
# if the board is valid, return 'Finished!'
# otherwise return 'Try again!'

# check rows
# check colums
# check regions
# region ranges [0..2], [3..5], [6..8]


full_test = [
[5, 3, 4, 6, 7, 8, 9, 1, 2], 
[6, 7, 2, 1, 9, 5, 3, 4, 8],
[1, 9, 8, 3, 4, 2, 5, 6, 7],
[8, 5, 9, 7, 6, 1, 4, 2, 3],
[4, 2, 6, 8, 5, 3, 7, 9, 1],
[7, 1, 3, 9, 2, 4, 8, 5, 6],
[9, 6, 1, 5, 3, 7, 2, 8, 4],
[2, 8, 7, 4, 1, 9, 6, 3, 5],
[3, 4, 5, 2, 8, 6, 1, 7, 9]]


def done_or_not(board)
    # create counters to track how many pass the check
    row_count = 0
    column_count = 0
    region_count = 0
    output = ''
    # check rows
    board.each do |current_row|
        if current_row == current_row.uniq
            row_count += 1
        end
    end
    
    # inverts the array so that columns are rows to check
    columns = board.transpose
    columns.each do |current_column|
        if current_column == current_column.uniq
            column_count += 1
        end
    end
   
    region_a = []
    region_b = []
    region_c = []
    region_array = []

    # checking top block of regions
    (0..2).each do |x|
        (0..2).each do |y|
           region_a << board[x][y]
        end
        (3..5).each do |y|
            region_b << board[x][y]
        end
        (6..8).each do |y|
            region_c << board[x][y]
        end
    end

    region_array << region_a
    region_array << region_b
    region_array << region_c

    # checking middle block of regions
    region_a = []
    region_b = []
    region_c = []
    (3..5).each do |x|
        (0..2).each do |y|
           region_a << board[x][y]
        end
        (3..5).each do |y|
            region_b << board[x][y]
        end
        (6..8).each do |y|
            region_c << board[x][y]
        end
    end
    region_array << region_a
    region_array << region_b
    region_array << region_c

    # checking bottom block of regions
    region_a = []
    region_b = []
    region_c = []
    (6..8).each do |x|
        (0..2).each do |y|
           region_a << board[x][y]
        end
        (3..5).each do |y|
            region_b << board[x][y]
        end
        (6..8).each do |y|
            region_c << board[x][y]
        end
    end
    region_array << region_a
    region_array << region_b
    region_array << region_c

    # check regions
    region_array.each do |current_region|
        if current_region == current_region.uniq
            region_count += 1
        end
    end
    
    # check all counts
    if row_count + column_count + region_count == 27
        output = "Finished!"
    else
        output = "Try again!"
    end

    return output
end

print done_or_not(full_test)


# from codewars

def regions(board)
    regions = board.each_slice(3).map do |three_rows|
      three_rows.transpose.each_slice(3).map(&:flatten)
    end.flatten(1)
end
