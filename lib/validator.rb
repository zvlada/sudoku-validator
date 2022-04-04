require 'set'
require 'sudoku_parser'

class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    parsed_sudoku_string = SudokuParser.new(@puzzle_string)
    
    if(check_for_duplicate_values(parsed_sudoku_string.convert_to_array))
      return 'Sudoku is invalid.'
    end

    if parsed_sudoku_string.contains_zero_values?
      return 'Sudoku is valid but incomplete.'
    else
      return 'Sudoku is valid.'
    end
  end

  private 

  def check_for_duplicate_values(sudoku_array)
    sudoku_values = Set.new

    sudoku_array.each_with_index do |sub_array, i|
      sub_array.each_with_index do |_, j|
        current_value = sudoku_array[i][j]
          if(current_value.to_i != 0)
            if(sudoku_values.add?("#{current_value}" + " row " + "#{i}").nil? || 
               sudoku_values.add?("#{current_value}" + " column " + "#{j}").nil? || 
               sudoku_values.add?("#{current_value}" + " sub box " + "#{i/3}" + "-" + "#{j/3}").nil?
            )
              return true
            end
          end
      end
    end

    return false
  end
end
