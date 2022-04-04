class SudokuParser
  attr_reader :puzzle_string

  def initialize(puzzle_string)
    @puzzle_string = extract(puzzle_string)
  end

  def convert_to_array
    @puzzle_string
      .split("\n")
      .reject(&:empty?)
      .map {|value| value.split("")}
  end

  def contains_zero_values?
    @puzzle_string.include?("0")
  end

  private

  def extract(puzzle_string)
    puzzle_string.delete("^0-9\\\n")
  end
end