require 'pry'

class TicTacToe
    attr_accessor :board
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]    
    ]

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "------------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "------------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(string)
        string.to_i-1
    end

    def move(i, token = "X")
        self.board[i] = token
    end

    def position_taken?(i)
        self.board[i].include?("X") || self.board[i].include?("O")
    end

    def valid_move?(i)
        (0..8).include?(i) && !position_taken?(i)
    end

    def turn_count
        turns = 0
        self.board.each do |square|
            if square.include?("X") || square.include?("O")
                turns += 1
            end 
        end
        turns
    end

    def current_player
        if self.board.count("X") > self.board.count("O")
            return "O"
        else
            return "X"
        end
    end

    def turn
        puts "Please enter a number between 1 and 9"
        i = gets.chomp
        i = input_to_index(i)
        token = current_player
        if valid_move?(i)
            move(i, token)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combos|
            a = combos[0] 
            b = combos[1]
            c = combos[2]
            if self.board[a] == "X" && self.board[b] == "X" && self.board[c] == "X"
                return combos
            elsif self.board[a] == "O" && self.board[b] == "O" && self.board[c] == "O"
                return combos
            end
        end
        return false
    end

    def full?
        !self.board.include?(" ")
    end

    def draw?
        if won?
            return false
        elsif full?
            return true
        else
            return false
        end
    end

    # def winner
    #     binding.pry
    # end

    def over?
        draw? || won?
    end

    def winner
       self.board[won?[0]] unless !won?
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

end




# def won?
#     x_moves = []
#     o_moves = []
#     ## iterate through the board
#     self.board.each_with_index do |square, i|
#         if square.include?("X")
#             x_moves << i
#         elsif
#             square.include?("O")
#             o_moves << i 
#         end
#     end
#     #  binding.pry
#         WIN_COMBINATIONS.each do |combo|
#             binding.pry
#             if combo.all? { |nums| x_moves.include? nums } ||
#             combo.all? { |nums| o_moves.include? nums }
#             return combo.to_a
#         end
#             return false
#         end
#         # binding.pry
# end