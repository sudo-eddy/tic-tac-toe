require "spec_helper"

module TicTacToe
  describe Board do

    context "initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not_raise_error
      end

      it "sets the grid with three rows by default" do
        board = Board.new
        expect(board.grid.size).to eq(3)
      end
      it "creates three elems in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq(3)
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "foo")
        expect(board.grid).to eq "foo"
      end
    end

    context "#get_cell" do
      it "returns the cell based on the (x,y) coordinate" do
        grid = [["","",""],["","","something"],["","",""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(2,1)).to eq "something"
      end
    end

    context "#set_cell" do
      it "updates the value of the cell object at a (x,y) coordinate" do
        Example = Struct.new(:value)
        grid = [[Example.new("unchanged"),"",""], ["","",""], ["","",""]]
        board = Board.new(grid: grid)
        board.set_cell(0,0,"changed")
        expect(board.get_cell(0,0).value).to eq "changed"
      end
    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new }

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive (:winner?) { false }
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.newequal
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? is false and draw? is false" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { false }
        expect(board.game_over).to be_falsey
      end

      it "returns :winner when row has all equal objects." do
        grid = [
          [x_cell, x_cell, empty],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns false when there is no winner or draw" do
        grid = [
          [x_cell, empty, empty],
          [y_cell, empty, empty],
          [y_cell, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to be_falsey
      end
    end

  end
end
