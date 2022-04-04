require_relative '../lib/sudoku_parser'

describe 'sudoku parser' do
  let(:file) { File.read('spec/fixtures/valid_complete.sudoku') }
  let(:sudoku_parser) { SudokuParser.new(file) }

  context '.initialize' do
    it 'removes unnecessary characters' do
      expected_string = "859612437\n723854169\n164379528\n\n986147352\n375268914\n241593786\n\n432981675\n617425893\n598736241\n"

      expect(sudoku_parser.puzzle_string).to eq(expected_string)
    end
  end

  context '#convert_to_array' do
    it "converts puzzle string into array" do
      expected_array = [
        ["8", "5", "9", "6", "1", "2", "4", "3", "7"], 
        ["7", "2", "3", "8", "5", "4", "1", "6", "9"], 
        ["1", "6", "4", "3", "7", "9", "5", "2", "8"],
        ["9", "8", "6", "1", "4", "7", "3", "5", "2"],
        ["3", "7", "5", "2", "6", "8", "9", "1", "4"],
        ["2", "4", "1", "5", "9", "3", "7", "8", "6"],
        ["4", "3", "2", "9", "8", "1", "6", "7", "5"],
        ["6", "1", "7", "4", "2", "5", "8", "9", "3"], 
        ["5", "9", "8", "7", "3", "6", "2", "4", "1"]
     ]

      expect(sudoku_parser.convert_to_array()).to eq(expected_array)
    end
  end

  context '#contains_zero_values' do
    it 'finds zero value in puzzle string' do
      file = File.read('spec/fixtures/valid_incomplete.sudoku')
      sudoku_parser = SudokuParser.new(file)
  
      expect(sudoku_parser.contains_zero_values?).to be true
    end

    it 'does not find zero value in puzzle string' do
      expect(sudoku_parser.contains_zero_values?).to be false
    end
  end
end